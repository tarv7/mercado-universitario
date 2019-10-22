after :courses do
  User.find_or_create_by(name: 'Thales Augusto', email: 'thales@gmail.com',
                         semester: 8, course: Course.first) do |user|
    user.password = '123456'
  end

  User.find_or_create_by(name: 'Teste', email: 'teste@gmail.com',
                         semester: 5, course: Course.third) do |user|
    user.password = '123456'
  end

  User.find_or_create_by(name: 'Arthur Ramos', email: 'arthur@gmail.com',
                         semester: 1, course: Course.second) do |user|
    user.password = '123456'
  end
end
