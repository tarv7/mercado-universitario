after 'production:universities', 'production:addresses' do
  College.find_or_create_by(name: 'Soane Nazaré de Andrade', address: Address.first,
                            university: University.first)
end