
Booking.destroy_all
Car.destroy_all
User.destroy_all

postcodes_in_london = [
  # full postcodes for central London
  "EC1A", "EC1M", "EC1N", "EC1P", "EC1R", "EC1V", "EC1Y",
  "EC2A", "EC2M", "EC2N", "EC2P", "EC2R", "EC2V", "EC2Y",
  "EC3A", "EC3M", "EC3N", "EC3P", "EC3R", "EC3V",
  "EC4A", "EC4M", "EC4N", "EC4P", "EC4R", "EC4V", "EC4Y",
  # full postcodes for inner London
  "E1W", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "E13", "E14", "E15", "E16", "E17", "E18",
  "N1C", "N1", "N2", "N3", "N4", "N5", "N6", "N7", "N8", "N9", "N10", "N11", "N12", "N13", "N14", "N15", "N16", "N17", "N18", "N19", "N20", "N21", "N22",
  "NW1W", "NW1", "NW2", "NW3", "NW4", "NW5", "NW6", "NW7", "NW8", "NW9", "NW10", "NW11",
  "SE1P", "SE1", "SE2", "SE3", "SE4", "SE5", "SE6", "SE7", "SE8", "SE9", "SE10", "SE11", "SE12", "SE13", "SE14", "SE15", "SE16", "SE17", "SE18", "SE19", "SE20", "SE21", "SE22", "SE23", "SE24", "SE25", "SE26", "SE27", "SE28",
  "SW1A", "SW1E"
]

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
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", postcode: postcodes_in_london.sample)
end

User.create(first_name: "Guy", last_name: "McDonald", email: "gamcdonald@icloud.com", password: "password", postcode: postcodes_in_london.sample)

puts "Creating cars..."

20.times do
  Car.create(price: Faker::Commerce.price(range: 20..50.0), location: postcodes_in_london.sample + ", London", category: %w[4x4 hatchback estate].sample, seats: [2, 5, 7].sample, user_id: User.all.sample.id, make: Faker::Vehicle.make, model: Faker::Vehicle.model, year: Faker::Vehicle.year)
end

puts "Adding images to cars..."

# Car.all.each_with_index do |car, index|
#   # car.image_url = car_images[index]
#   car.save
# end

50.times do
  Booking.create(start_date: Faker::Date.between(from: 1.week.from_now, to: 3.month.from_now), end_date: Faker::Date.between(from: 3.month.from_now, to: 6.month.from_now), user_id: User.all.sample.id, car_id: Car.all.sample.id)
end

puts "Seeding complete!"
