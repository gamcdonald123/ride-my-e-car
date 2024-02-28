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

car_images = [
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709128466/photo-1707300235628-110c405efc1e_piqhac.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709128422/photo-1705771801928-4fceafdd6e55_sq0cey.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709128378/photo-1699077613292-ba56bd20b4e6_shcuyu.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130253/kenny-leys-HN30GTWuCJU-unsplash_kenzma.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130252/mitch-kemp-2w_Nxti8iKE-unsplash_uymfsk.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130252/charlie-deets-AkgALppFIwo-unsplash_kz3v7d.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130252/samuel-girven--zDgIKQufto-unsplash_ag8isd.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130251/mitch-kemp-W871S5Qy70g-unsplash_u45fep.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130250/martin-katler-DiJR_M1Mv_A-unsplash_cf9n4f.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130250/charlie-deets-D1W5QenBzlU-unsplash_vfrwzi.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130249/vlad-tchompalov-jwyO3NhPZKQ-unsplash_atzr5p.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130249/bram-van-oost-eaPkue76Ip4-unsplash_dtkq5n.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130249/dario-L1_XWJ_bRSM-unsplash_cb8r6c.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130247/matt-henry-1nVbppFJl-s-unsplash_les9y6.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130246/thomas-hetzler-Q1tiXZdnK0I-unsplash_e46ack.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130245/robbie-VYG_xg_JsdI-unsplash_pstdhu.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130245/martin-katler-lE64qC_HHZM-unsplash_dhkgvi.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130244/ivan-kazlouskij-ai43U5e3VJc-unsplash_tu6sbw.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130244/ivan-kazlouskij-8oCDlGeHPcc-unsplash_ccvigf.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130243/kajetan-daroch-9-UPn1jLwaY-unsplash_ocqugz.jpg",
  "https://res.cloudinary.com/djqkw5dd4/image/upload/v1709130243/swansway-motor-group-jrqnnic-NDk-unsplash_gokzrj.jpg"
]

puts "Seeding..."
puts "Creating users..."
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
end

puts "Creating cars..."

20.times do
  Car.create(price: Faker::Commerce.price(range: 20..50.0), location: Faker::Address.city, category: %w[4x4 hatchback estate].sample, seats: [2, 5, 7].sample, user_id: User.all.sample.id, make: Faker::Vehicle.make, model: Faker::Vehicle.model, year: Faker::Vehicle.year)
end

puts "Adding images to cars..."

Car.all.each_with_index do |car, index|
  car.image_url = car_images[index]
  car.save
end

50.times do
  Booking.create(start_date: Faker::Date.between(from: 1.week.from_now, to: 3.month.from_now), end_date: Faker::Date.between(from: 3.month.from_now, to: 6.month.from_now), user_id: User.all.sample.id, car_id: Car.all.sample.id)
end

puts "Seeding complete!"
