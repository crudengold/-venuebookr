# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

User.destroy_all
puts "Destroy all users"
Venue.destroy_all
puts "Destroy all venues"

5.times do |i|
  user = User.new
  user.email = Faker::Internet.email
  user.password = 123456
  user.save!
  puts "#{user.email} created!"
end

10.times do |i|
  venue = Venue.new
  venue.name = Faker::Company.name
  venue.description = Faker::Restaurant.review
  venue.price_per_hour = rand(100)
  venue.location = Faker::Address.city
  venue.capacity = rand(300)
  venue.user = User.all.sample
  venue.save!
  puts "#{venue.name} created!"
end
