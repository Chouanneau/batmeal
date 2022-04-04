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

file_cook = "cook.html"
doc_cook = Nokogiri::HTML(File.open(file_cook), nil, "utf-8")
file = "recipes.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

username = ["Brice", "Matthieu", "David", "Alex", "Cataline", "Momo", "Quentin", "Antoine", "Thibault", "Pedro" ]
first_name = ["Brice", "Matthieu", "David", "Alex", "Cataline", "Momo", "Quentin", "Antoine", "Thibault", "Pedro" ]
last_name = ["Palau", "Gerard", "Cali", "Houston", "Manwel", "Siroté", "Ricard", "Gin", "Tonic", "Calster" ]
email = ["brice@gmail.com", "matthieu@gmail.com", "david@gmail.com", "alex@gmail.com", "cataline@gmail.com", "momo@gmail.com", "quentin@gmail.com", "antoine@gmail.com", "thibault@gmail.com", "pedro@gmail.com" ]
password = ["123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456" ]
address_street = ["Chemin de Montagny", "Route de la Pale", "Chemin des Sablons", "Avenue du Temple", "Chemin de la Pommeraie", "Chemin de Vuichardaz", "Chemin des Crêts", "Rue du Jura", "Chemin de Prellionnaz", "Avenue Jean-Jacques Cart"   ]
address_street_number = [55, 8, 13, 61, 15, 11, 17, 1, 11, 5 ]
city = ["Villette", "Danges", "Lausanne", "Lausanne", "Prilly", "Bussigny", "Genève", "Genève", "Morges", "Morges" ]
zipcode = ["1091", "1026", "1007", "1012", "1008", "1030", "1209", "1201", "1110", "1110" ]
country = ["Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland" ]
phone_number = ["0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000"]
is_customer = [true, true, true, true, true, true, true, true, true, true ]
is_cook = [false, true, true, true, true, true, true, true, true, true ]
role = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]

doc_cook.search('.answer img').first(10).each_with_index do |element, i|
  user = User.new(username: username[i], first_name: first_name[i], last_name: last_name[i], email: email[i], password: "123456", address_street: address_street[i], address_street_number: address_street_number[i], city: city[i], zipcode: zipcode[i] , country: country[i], phone_number: phone_number[i], is_customer: is_customer[i], is_cook: is_cook[i], role: role[i] )
  photo_url = element.attribute('src')
  photo_file_cook = URI.open(photo_url)
  user.avatar.attach(io: photo_file_cook, filename: "avatar.jpg", content_type: 'image/jpg')
  photo_url2 = "https://assets.caisy.io/assets/c5b98fcc-5e23-4df0-a5cd-2a7527d26cff/auOkRmCA7i/e697978e-fefc-40b7-96bc-2d6e08655cadd75a8d1fff3e49f7aea027be33306018edbf286bc1124d7d801445e04a2555d50150102V8Zarge009.jpg?w=1536&h=864"
  photo_file_banner = URI.open(photo_url2)
  user.banner.attach(io: photo_file_banner, filename: "banner.jpg", content_type: 'image/jpg')
  user.save!
end


categories = ["starter", "main course", "desert", "drink"]
users = User.where(is_cook: true)
# byebug

doc.search('.card__recipe').first(9).each_with_index do |element, i|
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
    user: users[i]
    )
    meal.photo.attach(io: photo_file, filename: "#{title}.jpg", content_type: 'image/jpg')
    meal.save!
end
