after :users do
  Seller.find_or_create_by!(user: User.first, name: FFaker::Company.name) do |s|
    s.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test.jpeg')), filename: 'test.jpeg')
  end

  Seller.find_or_create_by!(user: User.second, name: FFaker::Company.name) do |s|
    s.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test.jpeg')), filename: 'test.jpeg')
  end
end