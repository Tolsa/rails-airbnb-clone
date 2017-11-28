# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Suppression de l'ancien seed..."
Spaceship.destroy_all

puts "Done..."
puts "Creation nouveau seed..."

5.times do
  user = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
  Spaceship.create(name: Faker::StarWars.vehicle, user_id: user.id, category: ['Space', 'Earth', 'Sea', 'Air'].sample, seats: (1..10).to_a.sample)
end

puts "Fait ! création de #{Spaceship.count} vaisseaux"

