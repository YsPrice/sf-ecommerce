# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


Product.create(name: 'Adon', price: 20.00, quantity: 3, image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706794679/oc3icahfu7l08gs5hcis.png')
Product.create(name:,price:,quantity:,image:)
Product.create(name:'Ryu', price: 30.00, quantity: 3, image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800161/nzmwiggxxdglh5ks96zb.jpg')
Product.create(name:'Chun-Li', price: 28.00, quantity: 3,image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800264/chunli_jkor7v.jpg')
Product.create(name: 'Gouki', price:0.00, quantity:1, image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800373/gouki_jktbt9.jpg')