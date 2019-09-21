after :sellers do
  Product.find_or_create_by(name: 'Pizza grande de frango', price: 22.5,
                            description: FFaker::Lorem.phrase, seller: Seller.first)
  Product.find_or_create_by(name: 'Lasanha', price: 15,
                            description: FFaker::Lorem.phrase, seller: Seller.first)
  Product.find_or_create_by(name: 'Bolinhos', price: 2,
                            description: FFaker::Lorem.phrase, seller: Seller.first)
  Product.find_or_create_by(name: 'Churros do chaves', price: 3,
                            description: FFaker::Lorem.phrase, seller: Seller.first)
  Product.find_or_create_by(name: 'Brigadeiro', price: 1.5,
                            description: FFaker::Lorem.phrase, seller: Seller.first)

  Product.find_or_create_by(name: 'Pulseiras', price: 2,
                            description: FFaker::Lorem.phrase, seller: Seller.second)
  Product.find_or_create_by(name: 'Camisa do curso', price: 14,
                            description: FFaker::Lorem.phrase, seller: Seller.second)
  Product.find_or_create_by(name: 'Capa para celular', price: 5,
                            description: FFaker::Lorem.phrase, seller: Seller.second)
  Product.find_or_create_by(name: 'Limpa vidros', price: 1,
                            description: FFaker::Lorem.phrase, seller: Seller.second)
end