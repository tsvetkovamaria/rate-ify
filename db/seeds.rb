# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

# Users section

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(name: 'maria', email: 'admin@example.com', password: '123456', password_confirmation: '123456' )
5.times do
  User.create!(
    name: FFaker::Name.name, 
    email: FFaker::Internet.email, 
    password: '123456', 
    password_confirmation: '123456'
  )
end
users = User.all
# Places
categories = Category.create!([{name: "Bar"}, {name: "Night Club"}, {name: "Restaurant"}, {name: 'Tavern'}])
for i in 0...21
  Place.create!({
    :image => File.new("#{Rails.root}/app/assets/images/fixtures/places/#{i}.jpg"),
    title: FFaker::Product.brand,
    description: FFaker::Lorem.phrase,
    user: users[rand(0...users.size)],
    category: categories[rand(0...categories.size)],
  })
end
places = Place.all

images = ['deer', 'fall', 'girl', 'ghost', 'house', 'kitten', 'lake', 'pool', 'sport', 'sunset', 'duck']

for i in 0...images.size
  img = images[i]
  Picture.create!({
    :image => File.new("#{Rails.root}/app/assets/images/fixtures/pictures/#{img}.jpg"),
    user: users[rand(0...users.size)],
    place: places[rand(0...places.size)]
    })
end

100.times do
  Review.create!({
    body: FFaker::HipsterIpsum.phrase,
    user: users[rand(0...users.size)],
    place: places[rand(0...places.size)],
    grade_food: rand(0..5),
    grade_service: rand(0..5),
    grade_interior: rand(0..5)
    })
end