# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating users"
User.create!(email:"toto@gmail.com", password: "toto13")
User.create!(email:"titi@gmail.com", password: "titi13")
User.create!(email:"tutu@gmail.com", password: "tutu13")
puts "Creating users ok !"

puts "Creating figurines"
Figurine.create!(name: "Han Solo", year: 1977, brand: "Kenner" , description: "Good shape", user_id: 2)
Figurine.create!(name: "Luke Skywalker", year: 1977, brand: "Kenner" , description: "Good shape", user_id: 3)
Figurine.create!(name: "Baby Yoda", year: 2019, brand: "Funko Pop" , description: "New", user_id: 1)
puts "Creating figurines ok !"
