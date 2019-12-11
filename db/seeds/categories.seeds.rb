# c = Category.build(name: 'Comida')
# c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'comida.jpeg')), filename: 'comida.jpeg')
# c.save

Category.find_or_create_by(name: 'Comida') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'comida.jpeg')), filename: 'comida.jpeg')
end

Category.find_or_create_by(name: 'Artes') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'artes.jpeg')), filename: 'artes.jpeg')
end

Category.find_or_create_by(name: 'Vestimentas') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'vestimentas.jpeg')), filename: 'vestimentas.jpeg')
end

Category.find_or_create_by(name: 'Outros') do |c|
  c.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', 'outros.jpeg')), filename: 'outros.jpeg')
end