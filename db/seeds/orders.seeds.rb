after :sellers, :users do
  Order.find_or_create_by(note: FFaker::Lorem.phrase, status: 1, seller: Seller.first,
                          user: User.second)
  Order.find_or_create_by(note: FFaker::Lorem.phrase, status: 1, seller: Seller.first,
                          user: User.last)
end