# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create(name: 'Aurora Shelter', city: 'Aurora, CO', foster_program: false, rank: 2)
  pet_1 = Pet.create(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow', shelter_id: shelter.id)
  pet_2 = Pet.create(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe', shelter_id: shelter.id)
  pet_3 = Pet.create(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: shelter.id)

shelter_2 = Shelter.create(name: 'Maxfund', city: 'Denver, CO', foster_program: true, rank: 8)
  pet_1 = Pet.create(adoptable: true, age: 1, breed: 'tabby', name: 'Bowie', shelter_id: shelter.id)
  pet_2 = Pet.create(adoptable: true, age: 6, breed: 'tabby', name: 'Stella', shelter_id: shelter.id)
  pet_3 = Pet.create(adoptable: true, age: 8, breed: 'daschund', name: 'Dijon', shelter_id: shelter.id)

shelter_3 = Shelter.create(name: 'Dumb Friends League', city: 'Denver, CO', foster_program: true, rank: 5)
  pet_1 = Pet.create(adoptable: true, age: 11, breed: 'domestic sh', name: 'Chanel', shelter_id: shelter.id)
  pet_2 = Pet.create(adoptable: true, age: 4, breed: 'domestic sh', name: 'Toby', shelter_id: shelter.id)
  pet_3 = Pet.create(adoptable: true, age: 2, breed: 'boxer/australian cattle dog', name: 'Bert', shelter_id: shelter.id)
