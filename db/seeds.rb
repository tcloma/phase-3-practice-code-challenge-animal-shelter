puts "Creating seeds..."

Shelter.destroy_all
Adopter.destroy_all
Pet.destroy_all

puts "seeding shelters..."

5.times do
  Shelter.create!(name: "#{Faker::ProgrammingLanguage.name} shelter", address: Faker::Address.street_address)
end

puts "seeding adopters..."

10.times do
  Adopter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

puts "seeding pets..."

15.times do
  Pet.create!(name: Faker::FunnyName.name, age: rand(1..20), species: Faker::Creature::Animal.name, adopted?: random_boolean = [true, false].sample, shelter_id: Shelter.all.sample.id, adopter_id: Adopter.all.sample.id )
end

puts "Seeding completed!"