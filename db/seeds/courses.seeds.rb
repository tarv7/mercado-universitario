after :universities do
  Course.find_or_create_by(name: 'Ciência da computação',
                           shift: 1, university: University.first)
  Course.find_or_create_by(name: 'Engenharia',
                           shift: 2, university: University.first)
  Course.find_or_create_by(name: 'Medicina',
                          shift: 2, university: University.first)
  Course.find_or_create_by(name: 'Biologia',
                           shift: 2, university: University.second)
  Course.find_or_create_by(name: 'Educação Física',
                           shift: 3, university: University.second)
end