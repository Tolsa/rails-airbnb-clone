# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
p "destroying spaceships"
Spaceship.destroy_all

p "fetching spaceships"
5.times do
  user = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
  Spaceship.create(name: Faker::StarWars.vehicle, prize: (100..100000).to_a.sample, user_id: user.id, category: ['Espace', 'Air', 'Aquatique', 'Terrestre'].sample, seats: (1..10).to_a.sample)
end


Spaceship.first.update_attributes(weapons: '2 blasters', prize: 24000, category: 'Espace', seats: 5, constructor: 'jawa', maxspeed: '500km/h', planet: 'Tatooine' )
