# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


Product.create(name: 'Adon', price: 20.00, quantity: 3, category: 'STREET_FIGHTER_ALPHA',image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706794679/oc3icahfu7l08gs5hcis.png')
Product.create(name:,price:,quantity:,category:, image:)
Product.create(name:'Ryu', price: 30.00, quantity: 3, category: 'STREET_FIGHTER_2'image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800161/nzmwiggxxdglh5ks96zb.jpg')
Product.create(name:'Chun-Li', price: 28.00, quantity: 3, category: 'STREET_FIGHTER_2', image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800264/chunli_jkor7v.jpg')
Product.create(name: 'Gouki', price: 0.00, quantity: 1,  category: 'STREET_FIGHTER_2', image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800373/gouki_jktbt9.jpg')
Product.create(name:'Bison',price: 100.00, quantity:10, category: 'STREET_FIGHTER_2', image: 'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706815887/zuwcimsxq3svuyqcqfrv.jpg')
Product.create(name:'Ken',price: 28.00, quantity:3, category:'STREET_FIGHTER_2', image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706800644/ken_ibjdgk.jpg')
Product.create(name:'Dhalsim',price:25.00, quantity:4, category:'STREET_FIGHTER_2', image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706815803/dhalsim_xcn7tz.jpg')
Product.create(name:'E.Honda',price:25.00,quantity:5,category:'STREET_FIGHTER_2', image:'https://res.cloudinary.com/ducg1tnoi/image/upload/v1706815991/ehonda_zd29bv.jpg')