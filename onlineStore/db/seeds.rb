# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product = Product.create([{name: 'Book', description: 'This is a book', image: 'book.jpeg', price: 2.22},
  {name: 'Macbook Air', description: 'This is an apple laptop', image: 'macbook.jpeg', price: 1222.22},
  {name: 'Bike', description: 'What a nice bike', image: 'bike.jpeg', price: 222.22},
  {name: 'iPhone', description: 'a fake funny nose', image: 'iPhone.jpeg', price: 22.22}])
User.delete_all
user = User.create(name: 'assignment4', password_digest: 'newpassword')
user.password = 'newpassword'
user.password_confirmation = 'newpassword'
user.save
