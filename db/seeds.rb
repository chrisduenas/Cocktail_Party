# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

i = 0
gender_selection = ['female', 'male']
2.times do
  10.times do
    RandomUserGenerator.configure do |config|
      config.gender = gender_selection[i]
    end
    person = RandomUserGenerator.generate
    User.create!({
      name: person.name.first.capitalize,
      email: person.email,
      bartender: [true, false].sample,
      gender: gender_selection[i].capitalize,
      password: "123456",
      password_confirmation: "123456",
      proper_age: rand(21..40),
      home_address: Faker::Address.street_address,
      flair: nil,
      mixologist: nil,
      standard: nil
    })
  end
  User.bartender.each do |bartender|
    bartender.update(
      rate: rand(10..40),
      standard: [true, false].sample,
      flair: [true, false].sample,
      mixologist: [true, false].sample,
      rating: rand(3..5),
      monday: [true,false].sample,
      tuesday: [true,false].sample,
      wednesday: [true,false].sample,
      thursday: [true,false].sample,
      friday: [true,false].sample,
      saturday: [true,false].sample,
      sunday: [true,false].sample,
      bio: "Hi my name is #{bartender.name} and I have been a bartender for 10 years. I currently live in Miami and my rate is #{bartender.rate} Feel free to message me so we can discuss more information."
    )
  end
 i= i +1
  end
Event.create(user: User.regular.sample, bartender: User.bartender.sample, location: "FunkyTown", confirmed: false)
