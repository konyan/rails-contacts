# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.destroy_all
Contact.destroy_all

group_ids = []

group_ids << Group.create(name: "Family").id
group_ids << Group.create(name: "Client").id
group_ids << Group.create(name: "Friends").id
group_ids << Group.create(name: "Colleages").id

p "${group_ids.count} created"

group_count = group_ids.count
number_of_contacts = 20
contacts = []

number_of_contacts.times do |i|
  new_contact = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    company: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
    group_id: group_ids[Random.rand(0...group_count)]
  }
  contacts << new_contact
end

Contact.create(contacts);