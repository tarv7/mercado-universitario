after :courses, :addresses do
  User.find_or_create_by(name: 'Thales Augusto', email: 'thales@gmail.com',
                         semester: 8, course: Course.first,
                         address: Address.last) do |user|
    user.password = '123456'
  end

  User.find_or_create_by(name: 'Teste', email: 'teste@gmail.com',
                        semester: 5, course: Course.third,
                        address: Address.second) do |user|
    user.password = '123456'
  end

  User.find_or_create_by(name: 'Arthur Ramos', email: 'arthur@gmail.com',
                        semester: 1, course: Course.second,
                        address: Address.third) do |user|
    user.password = '123456'
  end
end