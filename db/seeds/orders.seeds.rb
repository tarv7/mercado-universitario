after :users, :addresses do
  Order.find_or_create_by(note: FFaker::Lorem.phrase, status: 1,
                          address: Address.first, price: 74.0)
  Order.find_or_create_by(note: FFaker::Lorem.phrase, status: 1,
                          address: Address.last, price: 50.5)
end
