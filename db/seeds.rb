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

OrderedMeal.destroy_all
Order.destroy_all
Meal.destroy_all
User.destroy_all
Review.destroy_all


file_cook = "cook.html"
doc_cook = Nokogiri::HTML(File.open(file_cook), nil, "utf-8")
file = "recipes.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")


username = ["Brice", "Matthieu", "David", "Alex", "Perry", "Momo", "Quentin", "Antoine", "Thibault", "Pedro", "Mario", "Alex", "Arthur", "Yannis", "Laurent", "Antonio", "Charlie", "Mathias", "Hans" ]
first_name = ["Brice", "Matthieu", "David", "Alex", "Perry", "Momo", "Quentin", "Antoine", "Thibault", "Pedro", "Mario", "Alex", "Arthur", "Yannis", "Laurent", "Antonio", "Charlie", "Mathias", "Hans" ]
last_name = ["Palau", "Chouanneau", "Cali", "Houston", "Manwel", "Siroté", "Ricard", "Gin", "Tonic", "Calster", "Chouanneau", "Chevalier", "Leloup", "Turbak", "Lieber", "Parizon", "De Turkheim", "Ledys", "Ferron" ]
email = ["brice@gmail.com", "matthieu@gmail.com", "david@gmail.com", "alex@gmail.com", "perry@gmail.com", "momo@gmail.com", "quentin@gmail.com", "antoine@gmail.com", "thibault@gmail.com", "pedro@gmail.com", "marion@gmail.com", "alice@gmail.com", "arthur@gmail.com", "yannis@gmail.com", "laurent@gmail.com", "antonio@gmail.com", "charlie@gmail.com", "mathias@gmail.com", "hans@gmail.com" ]
password = ["123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456", "123456" ]
address_street = ["Chemin de Montagny", "Route de la Pale", "Chemin des Sablons", "Avenue du Temple", "Chemin de la Pommeraie", "Chemin de Vuichardaz", "Chemin des Crêts", "Rue du Jura", "Chemin de Prellionnaz", "Avenue Jean-Jacques Cart", "Avenue de la Rochelle", "Avenue de Severy", "Rue du Bourg", "Rue Enning", "Rue du Jura", "Route de Vevey", "Rue de Geneve", "Rue de l'Ale", "Avenue de Morges"  ]
address_street_number = [55, 8, 13, 61, 15, 11, 17, 1, 11, 5, 12, 2, 28, 10, 44, 12, 23, 22, 12 ]
city = ["Villette", "Denges", "Lausanne", "Lausanne", "Prilly", "Bussigny", "Genève", "Genève", "Morges", "Morges", "Prilly", "Lausanne", "Lausanne", "Lausanne", "Lausanne", "Pully", "Lausanne", "Lausanne", "Lausanne" ]
zipcode = ["1091", "1026", "1007", "1012", "1008", "1030", "1209", "1201", "1110", "1110", "1008", "1004", "1003", "1003", "1004", "1009", "1003", "1003", "1004" ]
country = ["Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland", "Switzerland" ]
phone_number = ["0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000"]
is_customer = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true ]
is_cook = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true ]
role = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
opening_hour = ["19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h","19h"]
closing_hour =["21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h","21h"]

bio = ["Chef Brice Palau is perhaps best known for being the man behind Rome’s only three-Michelin-starred restaurant, La Pergola.",
  "Synonymous with breaking Michelin stars records, Matthieu Chouanneau currently holds 17 Michelin stars. This makes him the current living chef with the most Michelin stars in the world.",
  "Another renowned French chef, David Cali has spent his 40-year career collecting Michelin stars. Growing up in his family's Michelin-star kitchen, he received his first star when he was just 26 and hasn't stopped since.",
  "As the world's third most decorated Michelin star chef, Alex Houston currently has twelve stars under his belt, more than any other Spanish chef.",
  "Perry Manwel directs eighteen restaurants across the world. His Alléno Paris au Pavillon Ledoyen is one of the oldest restaurants in Paris, situated in the Champs – Élysées gardens.",
  "Momo Siroté is the chef with the most Michelin stars, holding eight stars across his five restaurants.",
  "Known for his volatile kitchen demeanour and exceptional British cuisine, Quentin Ricard is arguably the most famous chef in the world.",
  "The Michelin guide might not be the ultimate honour amongst chefs in the United States, but Antoine Gin has gone about setting a fine example.",
  "With four restaurants across the world and 7 Michelin stars, this Japanese chef is a culinary icon has been promoting Japanese cuisine for nearly 50 years.",
  "Since its opening, Calster's Tokyo restaurant Ryugin has become became a destination for other culinary geniuses, including Joël Robuchon.",
  "Multi-award winning Swiss Chef, Mario Chouanneau, started his career as a humble pastry chef.",
  "Alex Chevalier needs little introduction. Arguably one of the most famous chefs in the world, this celebrity chef-proprietor holds 6 Michelin stars.",
  "Yet another Japanese chef on the list, Leloup has managed to rack up six Michelin stars with just two restaurants. ",
  "Yannis Turnak is best known for being the man behind the statue de la Vierge in Lausanne",
  "At 24, Laurent Lieber became the youngest chef in Spain and the second youngest in the world to receive a Michelin star.",
  "As a kid, this Spanish chef had dreams of becoming a footballer. However, his true passion was revealed after he started working at his family's tapas bar at the young age of 12.",
  "Charlie De Turckeim found himself in the world of food purely by chance when he started working in the El Poblet restaurant at the age of 17.",
  "Mathias Ledys, widely known as the 'Chef of the Century,' passed away on 6 August 2018. At the time he was decorated with 28 stars, more than any other chef in the world.",
  "Hans Ferron became the youngest chef in Spain and the second youngest in the world to receive a Michelin star."]

doc_cook.search('.answer img').first(19).each_with_index do |element, i|
  user = User.new(username: username[i], first_name: first_name[i], last_name: last_name[i], email: email[i], password: "123456", address_street: address_street[i], address_street_number: address_street_number[i], city: city[i], zipcode: zipcode[i], country: country[i], phone_number: phone_number[i], is_customer: is_customer[i], is_cook: is_cook[i], role: role[i], bio: bio[i], opening_hour: opening_hour[i], closing_hour: closing_hour[i] )

  photo_url = element.attribute('src')
  photo_file_cook = URI.open(photo_url)
  user.avatar.attach(io: photo_file_cook, filename: "avatar.jpg", content_type: 'image/jpg')
  # byebug
  photo_url2 = "https://assets.caisy.io/assets/c5b98fcc-5e23-4df0-a5cd-2a7527d26cff/auOkRmCA7i/e697978e-fefc-40b7-96bc-2d6e08655cadd75a8d1fff3e49f7aea027be33306018edbf286bc1124d7d801445e04a2555d50150102V8Zarge009.jpg?w=1536&h=864"
  photo_file_banner = URI.open(photo_url2)
  user.banner.attach(io: photo_file_banner, filename: "banner.jpg", content_type: 'image/jpg')
  # byebug
  user.save!
end


categories = ["starter", "main course", "desert", "drink"]
users = User.where(is_cook: true)

# byebug

doc.search('.card__recipe').first(19).each_with_index do |element, i|

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
