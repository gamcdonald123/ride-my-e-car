# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Car.destroy_all
User.destroy_all

puts "Seeding..."
puts "Creating users..."
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
end

puts "Creating cars..."

20.times do
  Car.create(price: Faker::Commerce.price(range: 20..50.0), location: Faker::Address.city, category: %w[4x4 hatchback estate].sample, seats: [2, 5, 7].sample, user_id: User.all.sample.id, make: Faker::Vehicle.make, model: Faker::Vehicle.model, year: Faker::Vehicle.year)
end

50.times do
  Booking.create(start_date: Faker::Date.between(from: 1.week.from_now, to: 3.month.from_now), end_date: Faker::Date.between(from: 3.month.from_now, to: 6.month.from_now), user_id: User.all.sample.id, car_id: Car.all.sample.id)
end

puts "Seeding complete!"
