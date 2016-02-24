# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#user = User.create([{first_name: 'Sam'}])

MULTIPLIER = 10

def gen_user_with_prof
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  user = userser.new
  user.first_name  = first_name
  user.last_name   = last_name
  user.email       = Faker::Internet.free_email("# first_name} #{last_name}")
  user.password = "qwerqwer"
  user.save

  profile = Profile.new
  profile.user_id = u.id
  profile.gender = rand(0..1) == 1 ? "Male" : "Female"
  profile.birthday = Faker::Date.between(50.years.ago, Date.today)
  profile.college = Faker::Company.name
  profile.from = "#{Faker::Address.city}, #{Faker::Address.state}"
  profile.lives = "#{Faker::Address.city}, #{Faker::Address.state}"
  profile.number = Faker::PhoneNumber.phone_number
  profile.words = Faker::Hipster.paragraph
  profile.about = Faker::Hipster.paragraph
  profile.save
end