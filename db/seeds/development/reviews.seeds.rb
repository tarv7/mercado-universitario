after 'development:sellers', 'development:users' do
  Review.find_or_create_by(value: 1, comment: FFaker::Lorem.phrase,
                           seller: Seller.first, user: User.first)
  Review.find_or_create_by(value: 5, comment: FFaker::Lorem.phrase,
                           seller: Seller.first, user: User.second)
  Review.find_or_create_by(value: 1, comment: FFaker::Lorem.phrase,
                           seller: Seller.second, user: User.first)
  Review.find_or_create_by(value: 2, comment: FFaker::Lorem.phrase,
                           seller: Seller.first, user: User.third)
  Review.find_or_create_by(value: 3, comment: FFaker::Lorem.phrase,
                           seller: Seller.first, user: User.last)
end