# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'
# p "destroying spaceships"
# Spaceship.destroy_all

# p "fetching spaceships"
# 50.times do
#   user = User.create(email:Faker::Internet.email , password:Faker::Internet.password(8))
#   Spaceship.create(name: Faker::StarWars.vehicle, user_id: user.id)
# end

# Spaceship.first.update_attributes(weapons: '2 blasters', category: 'spaceship', power: '200 parsec', seats: 5, constructor: 'jawa', maxspeed: '500km/h', size: '20m' )


require "open-uri"
require "nokogiri"

url = "https://www.starwars-universe.com/encyclopedie/vaisseaux_vehicules.php"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

urls = []
html_doc.search('#contenu_liste_encyclo a').first(100).each do |element|
   urls <<  element.attribute('href').to_s
end

names = []
urls.each do |spaceship|
 html_file = open(url).read
 html_doc = Nokogiri::HTML(html_file)
 url = "https://www.starwars-universe.com#{spaceship}"
 html_doc.search('.haut_bandeau_encart .titre').each do |element|
 names << element.text.gsub("\r\n\t\t\t\t", "").gsub("\t\t\t", "")
end
end

 names.uniq!


spaceships_infos = {}
urls.each do |spaceship|
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  url = "https://www.starwars-universe.com#{spaceship}"
  hash = {}

  html_doc.search('.infos li').each do |element|
    label = element.search(".info").text
    value = element.search(".valeur").text.gsub("\r\n\t\t\t\t", "").gsub("\t\t\t", "")
    if ["Catégorie", "Passagers", "Constructeur", "Armement", "Vitesse maximum"].include?(label)
      hash[label] = value
    end
  end
  names.each do |name|
  spaceships_infos[name] = hash
 spaceships_infos.reject! { |k| k == "" }
 spaceships_infos.delete("Vaisseaux et véhicules")
 p spaceships_infos
end
end


