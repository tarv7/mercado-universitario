after :users, :categories do
  Seller.find_or_create_by(user: User.first, category: Category.first)
  Seller.find_or_create_by(user: User.second, category: Category.last)
end