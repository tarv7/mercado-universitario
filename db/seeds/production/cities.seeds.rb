after 'production:states' do
    City.find_or_create_by(name: 'Ilhéus', state: State.first)
end