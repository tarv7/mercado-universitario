class OrderProductsController < ApplicationController
  def create
    set_product
    @order_product = OrderProduct.new(order_product_params
                                        .merge(user_id: current_user.id))

    if @order_product.save
      flash[:notice] = I18n.t('order_product.flash.notice.create')
    else
      flash[:alert] = I18n.t('order_product.flash.alert.create')
    end

    redirect_to @product
  end

  def update
    set_product
    set_order_product
    if @order_product.update(order_product_params)
      flash[:notice] = I18n.t('order_product.flash.notice.update')
      redirect_to @product
    else
      flash[:alert] = I18n.t('order_product.flash.alert.update')
      render 'products/show'
    end
  end

  private

  def set_order_product
    @order_product = OrderProduct.find_by(
      product_id: order_product_params[:product_id], user_id: current_user.id,
      order_id: nil
    )
  end

  def set_product
    @product = Product.find(order_product_params[:product_id])
  end

  def order_product_params
    params.require(:order_product).permit(:quantity, :product_id)
  end
end
