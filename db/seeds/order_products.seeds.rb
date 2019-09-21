after :orders, :products do
  OrderProduct.find_or_create_by(quantity: 12, product: Product.last,
                                 order: Order.first)
  OrderProduct.find_or_create_by(quantity: 1, product: Product.all[5],
                                order: Order.first)

  OrderProduct.find_or_create_by(quantity: 3, product: Product.first,
                                  order: Order.second)
end