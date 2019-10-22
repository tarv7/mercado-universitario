after :cities, :users do
  user1 = User.first
  user2 = User.second

  Address.find_or_create_by(street: 'Rua A', neighborhood: 'Centro',
                            city: City.first, number: 123, user: user1)
  Address.find_or_create_by(street: 'Rua B', neighborhood: 'Pontal',
                            city: City.second, number: 123, user: user2)
  Address.find_or_create_by(street: 'Rua C', neighborhood: 'Centro',
                            city: City.last, number: 123, user: user2)
  Address.find_or_create_by(street: 'Rua D', neighborhood: 'Novo',
                            city: City.third, number: 123, user: user1)
end
