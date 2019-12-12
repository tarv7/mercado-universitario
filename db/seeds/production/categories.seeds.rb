Category.find_or_create_by(name: 'Comidas') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'comidas.jpg')), filename: 'comidas.jpg')
end

Category.find_or_create_by(name: 'Vestimentas') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'vestimentas.jpg')), filename: 'vestimentas.jpg')
end

Category.find_or_create_by(name: 'Livros') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'livros.jpeg')), filename: 'livros.jpeg')
end

Category.find_or_create_by(name: 'Moradias') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'moradias.jpeg')), filename: 'moradias.jpeg')
end

Category.find_or_create_by(name: 'Serviços') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'servicos.jpg')), filename: 'servicos.jpg')
end

Category.find_or_create_by(name: 'Artes') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'artes.jpg')), filename: 'artes.jpg')
end

Category.find_or_create_by(name: 'Outros') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'outros.png')), filename: 'outros.png')
end
