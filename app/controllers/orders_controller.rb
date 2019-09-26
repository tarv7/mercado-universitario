class OrdersController < ApplicationController
  def index
    @shopping_cart = current_user.order_products.where(order: nil)
                                 .group_by { |o| o.product.seller }
    @orders = current_user.order_products.where.not(order: nil)
                                 .map(&:order)
  end
end
