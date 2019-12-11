after :universities, :addresses do
  College.find_or_create_by!(name: 'Soares Nazaré', address: Address.first,
                            university: University.first)
  College.find_or_create_by!(name: 'Campus A', address: Address.second,
                            university: University.second)
  College.find_or_create_by!(name: 'Campus B', address: Address.third,
                            university: University.second)
end