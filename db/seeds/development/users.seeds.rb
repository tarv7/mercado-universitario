after :college_has_courses do
  User.find_or_create_by(name: 'Thales Augusto', email: 'thales@gmail.com',
                         semester: 8, college_has_course: CollegeHasCourse.first) do |user|
    user.password = '123456'
  end

  User.find_or_create_by(name: 'Teste', email: 'teste@gmail.com',
                         semester: 5, college_has_course: CollegeHasCourse.second) do |user|
    user.password = '123456'
  end

  User.find_or_create_by(name: 'Arthur Ramos', email: 'arthur@gmail.com',
                         semester: 1, college_has_course: CollegeHasCourse.third) do |user|
    user.password = '123456'
  end
end
