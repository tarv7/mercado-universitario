after 'production:cities' do
  Address.find_or_create_by(street: 'Rodovia Jorge Amado, Km 16',
                            neighborhood: 'Salobrinho',
                            city: City.first, number: 16)
end
