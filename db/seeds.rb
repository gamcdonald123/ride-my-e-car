# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding..."
puts "Creating users..."
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, dob: Faker::Date.birthday(min_age: 18, max_age: 65))
end

puts "Creating cars..."

20.times do
  Car.create(price: Faker::Commerce.price(range: 20..50.0), location: Faker::Address.city, category: %w[4x4 hatchback estate].sample, seats: %i[2 5 7].sample, user_id: User.all.sample.id, make: Faker::Vehicle.make, model: Faker::Vehicle.model, year: Faker::Vehicle.year)
end

puts "Seeding complete!"
