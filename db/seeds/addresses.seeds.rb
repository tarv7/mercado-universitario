after 'cities' do
  Address.find_or_create_by(street: 'Rua A', neighborhood: 'Centro',
                            city: City.first, number: 123)
  Address.find_or_create_by(street: 'Rua B', neighborhood: 'Pontal',
                            city: City.second, number: 123)
  Address.find_or_create_by(street: 'Rua C', neighborhood: 'Centro',
                            city: City.last, number: 123)
  Address.find_or_create_by(street: 'Rua D', neighborhood: 'Novo',
                            city: City.third, number: 123)
end