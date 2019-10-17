module OrderHelper
  def info_product_order(order)
    product = order.product
    quantity = order.quantity
    total = quantity * product.price

    "R$#{total} - #{quantity}x #{product.name}"
  end

  def info_total_order(order_products)
    order_products.map{ |o| o.quantity * o.product.price }.reduce(0, :+)
  end
end
