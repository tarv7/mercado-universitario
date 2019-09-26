after :universities do
  Course.find_or_create_by(name: 'Ciência da computação',
                           shift: 'morning', university: University.first)
  Course.find_or_create_by(name: 'Engenharia',
                           shift: 'evening', university: University.first)
  Course.find_or_create_by(name: 'Medicina',
                          shift: 'evening', university: University.first)
  Course.find_or_create_by(name: 'Biologia',
                           shift: 'evening', university: University.second)
  Course.find_or_create_by(name: 'Educação Física',
                           shift: 'integral', university: University.second)
end