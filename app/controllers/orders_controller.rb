class OrdersController < ApplicationController
  before_action :define_nav_active, only: %i[index]
  # criar controle de permissões
  def index
    if restricted_area?
      index_for_seller
      @statuses = Order.statuses.keys
    else
      @addresses = current_user.addresses&.map { |a| [a.to_string, a.id] }
      index_for_user
      flash[:info] = 'Cadastre pelo menos um endereço
       para ser possível o delivery' if @addresses.count.zero?
    end
  end

  def create
    ops = order_products
    begin
      Order.transaction do
        order = Order.create!(order_params(ops))
        update_order_products(order, ops)
      end
      flash[:notice] = 'Seu pedido foi enviado para o vendedor!'
    rescue StandardError
      flash[:alert] = 'Erro ao fechar ao enviar o pedido para o vendedor'
    end

    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])

    if order.update(status: params[:order][:status])
      flash[:notice] = "Status da compra de #{order.user.name} atualizado"
    else
      flash[:alert] = "Erro ao atualizar o status da compra de #{order.user.name}"
    end

    redirect_to orders_path
  end

  private

  def define_nav_active
    params[:nav_active] = 'orders'
  end

  def order_params(ops)
    {
      note: params[:order][:note],
      price: price(ops),
      status: 'not_seen',
      address_id: params[:order][:address_id]
    }
  end

  def update_order_products(order, ops)
    OrderProduct.transaction do
      ops.each do |op|
        op.update!(order_id: order.id)
      end
    end
  end

  def order_products
    current_user.order_products
                .joins(product: [:seller])
                .where(order: nil,
                       products: {
                         seller_id: params[:order][:seller_id]
                       })
  end

  def price(order_products)
    order_products.map { |o| o.quantity * o.product.price }.reduce(0, :+)
  end

  def index_for_user
    @shopping_cart = current_user.order_products
                                 .includes(:product).where(order: nil)
                                 .group_by { |o| o.product.seller }
    @orders = current_user.order_products.includes(:order).where.not(order: nil)
                          .map(&:order).uniq
  end

  def index_for_seller
    @orders = Order.joins(order_products: [product: [:seller]])
                   .includes(:order_products, order_products: [:product])
                   .where("sellers.id = #{current_actor.id}").uniq
  end
end
