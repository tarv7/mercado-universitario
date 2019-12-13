after 'development:states' do
    City.find_or_create_by(name: 'Barra do Rocha', state: State.first)
    City.find_or_create_by(name: 'Ipiaú', state: State.first)
    City.find_or_create_by(name: 'Ilhéus', state: State.first)
    City.find_or_create_by(name: 'Salvador', state: State.first)
    City.find_or_create_by(name: 'Rio de Janeiro', state: State.second)
    City.find_or_create_by(name: 'Jauperi', state: State.second)
    City.find_or_create_by(name: 'Vitória', state: State.third)
end