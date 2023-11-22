# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
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

venues = ["The Whimsical Whiskey Haven", "Electric Elixir Lounge", "Moonlit Mirage Tavern",
  "Velvet Vibes Speakeasy", "Stardust Saloon", "Mystic Mixology Mansion", "Neon Nectar Nook",
  "Sapphire Soiree Spot", "Groovy Grapevine Grove", "Enchanted Ember Emporium"]

img_urls = ["https://media.timeout.com/images/105806374/750/562/image.jpg",
  "https://media.timeout.com/images/105807610/750/562/image.jpg",
  "https://offloadmedia.feverup.com/secretldn.com/wp-content/uploads/2017/05/18124223/tt-liquor-cellar-cocktail-bar-shoreditch-east-london-homepage-01-1.jpg",
  "https://static.designmynight.com/uploads/2019/12/FC_DMN_Shoreditch_1-optimised.jpg",
  "https://cdn.thenudge.com/wp-content/uploads/2022/12/lost-property-office-bar-768x512.jpg.webp",
  "https://static.designmynight.com/uploads/2021/07/5Z6A6828-HDR-optimised.jpg",
  "https://i.pinimg.com/originals/b2/be/8e/b2be8e696dd3cf0acf995204cbcc8d99.jpg",
  "https://media.timeout.com/images/105493421/750/562/image.jpg",
  "https://www.silverchef.com.au/cdn/shop/articles/36.jpg?v=1565665550",
  "https://cdn.thenudge.com/wp-content/uploads/2021/10/below-stone-nest-chapel-bar-inset-1-768x512.jpg.webp"]


(0..9).each do |i|
  venue = Venue.new
  venue.name = venues[i]
  venue.description = Faker::Restaurant.review
  venue.price_per_hour = rand(100)
  venue.location = Faker::Address.city
  venue.capacity = rand(300)
  venue.user = User.all.sample
  file = URI.open(img_urls[i])
  venue.photos.attach(io: file, filename: "bar.png", content_type: "image/png")
  if i != 9
    file = URI.open(img_urls[i + 1])
    venue.photos.attach(io: file, filename: "bar.png", content_type: "image/png")
  end
  venue.save!
  puts "#{venue.name} created!"
end
