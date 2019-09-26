after :sellers, :categories do
  Product.find_or_create_by(name: 'Pizza grande de frango', price: 22.5,
                            category: Category.first, seller: Seller.first,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Lasanha', price: 15,
                            category: Category.first, seller: Seller.first,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Bolinhos', price: 2,
                            category: Category.first, seller: Seller.first,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Churros do chaves', price: 3,
                            category: Category.second, seller: Seller.first,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Brigadeiro', price: 1.5,
                            category: Category.second, seller: Seller.first,
                            description: FFaker::Lorem.phrase)

  Product.find_or_create_by(name: 'Pulseiras', price: 2,
                            category: Category.second, seller: Seller.second,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Camisa do curso', price: 14,
                            category: Category.second, seller: Seller.second,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Capa para celular', price: 5,
                            category: Category.last, seller: Seller.second,
                            description: FFaker::Lorem.phrase)
  Product.find_or_create_by(name: 'Limpa vidros', price: 1,
                            category: Category.third, seller: Seller.second,
                            description: FFaker::Lorem.phrase)
end