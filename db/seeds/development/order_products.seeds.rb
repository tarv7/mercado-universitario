after 'development:orders', 'development:products', 'development:users' do
  OrderProduct.find_or_create_by(quantity: 12, product: Product.last,
                                 order: Order.first, user: User.first)
  OrderProduct.find_or_create_by(quantity: 1, product: Product.all[5],
                                order: Order.first, user: User.second)

  OrderProduct.find_or_create_by(quantity: 3, product: Product.first,
                                  order: Order.second, user: User.last)
end