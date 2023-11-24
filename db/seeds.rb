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
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = 123456
  user.save!
  puts "#{user.email} created!"
end

locations = [
  "Montmartre, Paris",
  "Trastevere, Rome",
  "Gràcia, Barcelona",
  "Kreuzberg, Berlin",
  "Prague 2, Prague",
  "Vesterbro, Copenhagen",
  "Old Town, Warsaw",
  "Södermalm, Stockholm",
  "Notting Hill, London",
  "Jordaan, Amsterdam",
  "Alfama, Lisbon",
  "Mitte, Vienna",
  "Gamla Stan, Stockholm",
  "Grindelwald, Interlaken",
  "Neubau, Vienna",
  "Santa Cruz, Seville",
  "Friedrichshain, Berlin",
  "El Born, Barcelona",
  "Saint-Gilles, Brussels",
  "Plaka, Athens",
  "Shoreditch, London",
  "Camden Town, London",
  "Brixton, London",
  "Chelsea, London",
  "Greenwich, London",
  "Hackney, London",
  "Islington, London",
  "Wimbledon, London",
  "Kensington, London",
  "Hampstead, London"
]

venues = [
  "The Whimsical Whiskey Haven",
  "Electric Elixir Lounge",
  "Moonlit Mirage Tavern",
  "Velvet Vibes Speakeasy",
  "Stardust Saloon",
  "Mystic Mixology Mansion",
  "Neon Nectar Nook",
  "Sapphire Soiree Spot",
  "Groovy Grapevine Grove",
  "Enchanted Ember Emporium",
  "Crimson Cabana Club",
  "Radiant Rum Rendezvous",
  "Jubilant Jukebox Junction",
  "Sizzling Spirits Sanctuary",
  "Azure Ale Alcove",
  "Opulent Oasis Oyster Bar",
  "Quirky Quaff Quarters",
  "Luminous Libation Lounge",
  "Harmony Hooch Hideaway",
  "Peachy Punch Pavilion",
  "Golden Goblet Grotto",
  "Cosmic Cocktail Corner",
  "Cherry Cheering Chamber",
  "Bamboo Breeze Brew House",
  "Whispering Willow Whisky Warehouse",
  "Sunny Side Sip Station",
  "Plush Plum Punch Parlor",
  "Velour Vortex Venue",
  "Majestic Mingle Manor",
  "Wildfire Watering Hole",
  "Fiesta Flame Front",
  "Euphoric Echo Emporium",
  "Harmonious Hops Hangout",
  "Emerald Ember Enclave",
  "Blissful Barrel Bungalow",
  "Pulsating Pineapple Pub",
  "Zesty Zephyr Zenith",
  "Celestial Celebration Cellar"
]

descriptions = [
  "Cozy hideaway for enchanting spirits in a whimsical atmosphere awaits.",
  "Immerse in vibrant cocktails and an electrifying ambiance.",
  "Escape to a mystical tavern, where moonlight creates an enchanting mirage.",
  "Step into a bygone era of sophistication and velvet-clad revelry.",
  "Experience the magic of mixology under the glittering canopy.",
  "Enter a mansion where mixology meets mystique, unveiling unique concoctions.",
  "Dive into a neon-lit nook serving vibrant nectars and lively atmosphere.",
  "Sophisticated spot where sapphire hues and stylish soirees converge.",
  "Join the groovy gathering under the grapevine for music and libations.",
  "Discover an emporium glowing with enchanted embers and exquisite drinks.",
  "Unwind in a cabana of crimson hues, where cocktails flow freely.",
  "Embark on a radiant rendezvous with exceptional rum blends.",
  "Dance the night away at this jukebox junction of jubilance and music.",
  "Indulge in spirits that sizzle and a sanctuary where laughter echoes.",
  "Find solace in an alcove adorned with azure hues and curated ales.",
  "Luxuriate in opulence at an oasis of oysters and refined spirits.",
  "Embrace the quirky side of libations in this unique quarters.",
  "Immerse in the luminosity of this lounge, where libations light up.",
  "Uncover the harmony of hooch in a clandestine hideaway.",
  "Sip on peachy punches in a pavilion that radiates warmth.",
  "Explore a grotto adorned with golden goblets for a regal experience.",
  "Get lost in the cosmos at this cocktail corner of celestial blends.",
  "Cheer with cherry-infused concoctions in a chamber filled with joy.",
  "Imbibe in a breezy brew house with bamboo accents and tropical vibe.",
  "Dive into the rich world of whisky at this warehouse.",
  "Bask in the sunshine at this sip station with sunny vibes.",
  "Indulge in plush surroundings while sipping on plum-infused punches.",
  "Enter a velour vortex of excitement, where the venue's ambiance swirls.",
  "Mingle in a manor exuding majesty, where every corner invites celebration.",
  "Ignite your senses at this watering hole where the wildfire of flavors awaits.",
  "Join the fiery fiesta at this flame-fronted venue, where the party never dims.",
  "Encounter euphoria in an emporium resonating with echoes of laughter.",
  "Discover the harmony of hops at this hangout, where craft beers abound.",
  "Immerse in the emerald glow of this enclave, where embers create intimacy.",
  "Find bliss in a bungalow adorned with barrels, offering a haven for delights.",
  "Let the pulsating vibes transport you to a tropical paradise.",
  "Reach the zenith of zest in this zen-inspired venue, where flavors fill the air.",
  "Host celestial celebrations in this cellar where every moment is enchanting."
]


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


(0..30).each do |i|
  venue = Venue.new
  venue.name = venues[i]
  venue.description = descriptions[i]
  venue.price_per_hour = 90 + rand(200)
  venue.location = locations.sample
  venue.capacity = rand(250)
  venue.user = User.all.sample
  file = URI.open(img_urls.sample)
  venue.photos.attach(io: file, filename: "bar.png", content_type: "image/png")
  file = URI.open(img_urls.sample)
  venue.photos.attach(io: file, filename: "bar.png", content_type: "image/png")
  venue.save!
  puts "#{venue.name} created!"
end
