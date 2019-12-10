class OrdersController < ApplicationController
  before_action :define_nav_active, only: %i[index]
  # criar controle de permissões
  def index
    if restricted_area?
      index_for_seller
      @statuses = Order.statuses_for_select
    else
      @addresses = current_user.addresses&.map { |a| [a.to_string, a.id] }
      index_for_user
      flash[:info] = I18n.t('order.flash.info.index') if @addresses.count.zero?
    end
  end

  def create
    ops = order_products
    begin
      order = transaction_create(ops)

      OrderMailer.with(order: order, user: current_user).create.deliver_later

      flash[:notice] = I18n.t('order.flash.notice.create')
    rescue StandardError
      flash[:alert] = I18n.t('order.flash.alert.create')
    end

    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])

    name = order.user.name

    if order.update(params_update)
      send_mail(order)
      flash[:notice] = I18n.t('order.flash.notice.update', name: name)
    else
      flash[:alert] = I18n.t('order.flash.alert.update', name: name)
    end

    redirect_to orders_path
  end

  private

  def send_mail(order)
    if params[:confirmed].present?
      OrderMailer.with(order: order).confirmed.deliver_later
    else
      OrderMailer.with(order: order).update.deliver_later
    end
  end

  def transaction_create(ops)
    Order.transaction do
      order = Order.create!(order_params(ops))
      update_order_products(order, ops)

      order
    end
  end

  def params_update
    return { confirmed: params[:confirmed] } if params[:confirmed].present?

    { status: params[:order][:status] }
  end

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
    @shopping_cart = orders_pendings
    @orders = orders_confirmeds
  end

  def orders_pendings
    current_user.order_products
                .includes(:product).where(order: nil)
                .group_by { |o| o.product.seller }
  end

  def orders_confirmeds
    current_user.order_products.includes(:order).where.not(order: nil)
                .order('id DESC').map(&:order).uniq
  end

  def index_for_seller
    @orders = Order.joins(order_products: [product: [:seller]])
                   .includes(:order_products, order_products: [:product])
                   .where("sellers.id = #{current_actor.id}")
                   .order('id DESC').uniq
  end
end
