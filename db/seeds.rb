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
50.times do
  user = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
  Spaceship.create(name: Faker::StarWars.vehicle, user_id: user.id)
end

Spaceship.first.update_attributes(weapons: '2 blasters', category: 'spaceship', power: '200 parsec', seats: 5, constructor: 'jawa', maxspeed: '500km/h', size: '20m' )

