require "nokogiri"
require "open-uri"
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# idee de scraping pour les skis

Meal.destroy_all
User.destroy_all
Order.destroy_all
Review.destroy_all

# user1 = User.create!(username: "Matthieu", address: "danstoncul", email: "test@gmail.com", password: "1213456")
# ski1 = Ski.create!(brand: "Rossignol", category:"alpin", sizing:"180", description: "Superbes !", price: 34, user: user1)
# ski2 = Ski.create!(brand: "Salomon", category:"alpin", sizing:"134", description: "Magiques !", price: 289, user: user1)
# file = "skis.html"
# idee de scraping pour les skis

file = "recipes.html"
file_cook = "cook.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")
doc_cook = Nokogiri::HTML(File.join(file_cook), nil, "utf-8")
# user1 = User.create!(username: "brice", first_name: "Brice", last_name:"Blanchard", email: "brice@gmail.com", password: "123456", address_street: "Chemin de la Pommeraie", address_street_number: 15, city: "Prilly", zipcode: "1008" , country: "Switzerland", phone_number:"0000000000", is_customer: true, is_cook: false )
# user2 = User.create!(username: "matthieu", first_name: "Matthieu", last_name:"Kalos", email: "matthieu@gmail.com", password: "123456", address_street: "Route de la Pale", address_street_number: 8, city: "Denges", zipcode: "1026" , country: "Switzerland", phone_number:"0000000000", is_customer: true, is_cook: true )
# user3 = User.create!(username: "david", first_name: "David", last_name:"Trinchin", email: "david@gmail.com", password: "123456", address_street: "Chemin des Sablons", address_street_number: 13, city: "Lausanne", zipcode: "1007" , country: "Switzerland", phone_number:"0000000000", is_customer: false, is_cook: true )
# user4 = User.create!(username: "alex", first_name: "Alex", last_name:"Pouard", email: "alex@gmail.com", password: "123456", address_street: "Avenue du Temple", address_street_number: 61, city: "Lusanne", zipcode: "1012" , country: "Switzerland", phone_number:"0000000000", is_customer: true, is_cook: false )
# user5 = User.create!(username: "cataline", first_name: "Cataline", last_name:"Raisin", email: "cataline@gmail.com", password: "123456", address_street: "Chemin de Montagny", address_street_number: 55, city: "Villette", zipcode: "1091" , country: "Switzerland", phone_number:"0000000000", is_customer: false, is_cook: true )
# user6 = User.create!(username: "momo", first_name: "Momo", last_name:"Mithe", email: "momo@gmail.com", password: "123456", address_street: "Chemin de Vuichardaz", address_street_number: 11, city: "Bussigny", zipcode: "1030" , country: "Switzerland", phone_number:"0000000000", is_customer: true, is_cook: false )
# user7 = User.create!(username: "quentin", first_name: "Quentin", last_name:"Claseon", email: "quentin@gmail.com", password: "123456", address_street: "Chemin des Crêts", address_street_number: 17, city: "Genève", zipcode: "1209" , country: "Switzerland", phone_number:"0000000000", is_customer: true, is_cook: true )
# user8 = User.create!(username: "antoine", first_name: "Antoine", last_name:"Kirst", email: "antoine@gmail.com", password: "123456", address_street: "Rue du Jura", address_street_number: 1, city: "Genève", zipcode: "1201" , country: "Switzerland", phone_number:"0000000000", is_customer: false, is_cook: true )





20.times do |user|
  user = User.create!(
    username: Faker::Name.first_name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    country: Faker::Address.country,
    password: "123456",
    address_street: Faker::Address.street_address,
    address_street_number: rand(1..10000),
    zipcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    # is_cook: false,
    # is_customer: true,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    role: rand(0..1)
    # user_avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
    )
    doc_cook.search('.answer').each do |element|
      photo_url = element.search('.answer img').attribute('src').to_s
      photo_file_cook = URI.open(photo_url)
      user.photo.attach(io: photo_file_cook, filename: "#{title}.jpg", content_type: 'image/jpg')
      user.save!
  end
end



    # user.each do |user|
    # end

    # user.each do |user|
    #   photo_file = "sss"
    #   user.photo.attach(io: photo_file, filename: "banner.jpg", content_type: 'image/jpg')
    #   user.save!
  # end
  # user.photo.attach(io: avatar, filename: "#{username}_avatar.jpg", content_type: 'image/jpg')
  # # user.photo.attach(io: user_avatar, filename: "#{username}_avatar.jpg", content_type: 'image/jpg')
  #   user.save!






  # 10.times do |user|
  #   User.create!(
  #   username: Faker::Name.first_name,
  #   first_name: Faker::Name.first_name,
  #   last_name: Faker::Name.last_name,
  #   email: Faker::Internet.email,
  #   country: Faker::Address.country,
  #   password: "123456",
  #   address_street: Faker::Address.street_address,
  #   address_street_number: rand(1..10000),
  #   zipcode: Faker::Address.zip_code,
  #   city: Faker::Address.city,
  #   phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  #   # is_cook: true,
  #   # is_customer: true,
  #   longitude: Faker::Address.longitude,
  #   latitude: Faker::Address.latitude,
  #   role: rand(0..1),
  #   bio: "",
  #   role: 1
  #   # user_avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
  #   # user_banner: ""
  # )
  #   photo_url = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
  #   user.photo.attach(io: photo_url, filename: "#{username}_banner.jpg", content_type: 'image/jpg')
  #   # user.photo.attach(io: user_avatar, filename: "#{username}_avatar.jpg", content_type: 'image/jpg')
  #   user.save!
  # end

  # if is_cook == true
#   bio:



categories = ["starter", "main course", "desert", "drink"]
doc.search('.card__recipe').each do |element|
  title = element.search('.card__title').text.strip
  description = element.search('.card__summary').text.strip
  # byebug

  photo_url = element.search('.inner-container img').attribute('src').value
  if photo_url
    photo_file = URI.open(photo_url)
  else
    photo_file = "https://www.google.com/search?q=meal+image&sxsrf=APq-WBu9oQjidS6REmblJ9Lo3w2XCWzzWw:1648553931603&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiWw_H7nev2AhUG_6QKHe2IARQQ_AUoAXoECAEQAw&biw=1489&bih=824&dpr=2#imgrc=AKz-OAB0-i4FzM"
  end


  meal = Meal.create!(
    title: title,
    description: description,
    quantity: rand(1..3),
    price: rand(3..10),
    category: categories.sample,
    date_time_start: Time.now,
    date_time_end: Date.tomorrow.in_time_zone.change(hour: 12),
    user: User.where(role: 1).sample


    # availability: true
    )
    meal.photo.attach(io: photo_file, filename: "#{title}.jpg", content_type: 'image/jpg')
    meal.save!
end
#   ski.photo.attach(io: photo_file, filename: "#{title}.jpg", content_type: 'image/jpg')
#   # article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#   ski.save!
# end
