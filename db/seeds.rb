# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


moin = User.create(email: "moin@moin.com", first_name: "Moin", last_name: "Uddin", username: "moin_u", password: "123456")
cameron = User.create(email: "cam@cam.com", first_name: "Cameron", last_name: "Dunn", username: "cam_d", password: "123456")



iPhoneX = Listing.create(title: "Iphone X", body: "Iphone X for trade", user: cameron)
acceptable_offer_for_iphonex = AcceptableOffer.create(title: "Samsung Galaxy S7", description: "Some description here", year: 2016, color: "black", listing_id: iPhoneX.id)
samsung_galaxy_7_edge = CounterOffer.create(title: "Samsung Galaxy S7 Edge", description: "Good Condition", acceptable_offer: acceptable_offer_for_iphonex, user: moin)
