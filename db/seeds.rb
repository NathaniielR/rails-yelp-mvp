# db/seeds.rb
Restaurant.destroy_all

5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
end

puts "Seeded 5 restaurants!"
