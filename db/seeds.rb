# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Admin

Admin.create(:email => "test_admin@yopmail.com", :password => "123456", :password_confirmation => "123456")

# Create Items

[
  {name: 'Item 1', description: 'Item 1 description', price: 200, quantity: 10},
  {name: 'Item 2', description: 'Item 2 description', price: 300, quantity: 12},
  {name: 'Item 3', description: 'Item 3 description', price: 400, quantity: 15},
  {name: 'Item 4', description: 'Item 4 description', price: 500, quantity: 17},
  {name: 'Item 5', description: 'Item 5 description', price: 600, quantity: 20},
].each do |attributes|
  Item.find_or_create_by(attributes)
end


