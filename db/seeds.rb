# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
Profile.destroy_all
Figurine.destroy_all

puts "Creating users"
user1 = User.create!(email:"toto@gmail.com", password: "toto13")
user2 = User.create!(email:"titi@gmail.com", password: "titi13")
user3 = User.create!(email:"tutu@gmail.com", password: "tutu13")
puts "Creating users ok !"

puts "Creating figurines"
Figurine.create!(name: "Han Solo", year: 1977, brand: "Kenner" , description: "Good shape", user_id: user1.id)
Figurine.create!(name: "Luke Skywalker", year: 1977, brand: "Kenner" , description: "Good shape", user_id: user2.id)
Figurine.create!(name: "Baby Yoda", year: 2019, brand: "Funko Pop" , description: "New", user_id: user3.id)
puts "Creating figurines ok !"

puts "Creating profiles"
Profile.create!(username: "Frodo", firstname: "Léo", lastname: "Vinci", city: "Roma", user_id: user1.id )
Profile.create!(username: "Darth75", firstname: "Manu", lastname: "Tudescends", city: "Paris", user_id: user2.id)
Profile.create!(username: "Tonydu13", firstname: "Matt", lastname: "Pokora", city: "Marseille", user_id: user3.id)
puts "Creating profiles ok"



