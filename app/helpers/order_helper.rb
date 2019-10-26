module OrderHelper
  def info_product_order(order)
    product = order.product
    quantity = order.quantity
    total = quantity * product.price

    "#{number_to_currency(total, locale: :'pt-BR')} - #{quantity}x #{product.name}"
  end

  def info_total_order(order_products)
    order_products.map{ |o| o.quantity * o.product.price }.reduce(0, :+)
  end

  def note_order(order)
    if order.address.present?
      "#{order.address.to_string}. #{order.note}"
    else
      "Retirar no vendedor. #{order.note}"
    end
  end
end
