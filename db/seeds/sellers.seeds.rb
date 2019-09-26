after :users do
  Seller.find_or_create_by(user: User.first, name: FFaker::Company.name)
  Seller.find_or_create_by(user: User.second, name: FFaker::Company.name)
end