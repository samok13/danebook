FactoryGirl.define do

  factory :user, aliases:[:author] do
    sequence(:first_name){ |n| "Foo#{n}" }
    sequence(:last_name){ |n| "Bar#{n}" }
    
    sequence(:email){ |n| "foo#{n}@bar.com" }
    birthday "10/22/1987"
    gender "Female"
    password "foobar"
  end

end