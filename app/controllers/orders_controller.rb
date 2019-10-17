class OrdersController < ApplicationController
  # criar controle de permissões
  def index
    if restricted_area?
      index_for_seller
      @statuses = Order.statuses.keys
    else
      index_for_user
    end
  end

  def create
    ops = order_products

    Order.transaction do
      order = Order.create!(note: params[:order][:note], price: price(ops), status: 'not_seen')
      OrderProduct.transaction do
        ops.each do |op|
          op.update!(order_id: order.id)
        end
      end
    end

    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    order.update(status: params[:order][:status])

    redirect_to orders_path
  end

  private

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
