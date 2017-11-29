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
user1 = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
Spaceship.create(name: 'Boolbouuu' , prize: 1000, user_id: user1.id, seats: 4, constructor: 'BMV', weapons: 'blasters', maxspeed: '500km/h', planet: 'Alderaan', category: 'Espace')

user2 = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
Spaceship.create(name: 'Piripik' , prize: 2450, user_id: user2.id, seats: 15, constructor: 'Renault', weapons: 'Iron full blasters', maxspeed: '1500km/h', planet: 'Tatooine', category: 'Espace')

user3 = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
Spaceship.create(name: 'AT-T' , prize: 40500, user_id: user3.id, seats: 50, constructor: 'Jawas', weapons: '4 big blasters', maxspeed: '60km/h', planet: 'Hoth', category: 'Terrestre')

user4 = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
Spaceship.create(name: 'QDB7' , prize: 21000, user_id: user4.id, seats: 3, constructor: 'Landos', weapons: 'Railgun', maxspeed: '1500km/h', planet: 'Coruscant', category: 'Espace')

user5 = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
Spaceship.create(name: 'Pikachu' , prize: 50, user_id: user5.id, seats: 7, constructor: 'Hyundai', weapons: 'Lightning', maxspeed: '3km/h', planet: 'Mustafar', category: 'Terrestre')







