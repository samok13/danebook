FactoryGirl.define do

factory :profile
  college "The Tute"
  hometown "Carlisle"
  lives "San Francisco"
  about "Things about me."
  words "Other important words."

  #it looks like I have birthdays in both user and profile tables? Not sure how to handle
  user
  #indicates an association with expected naming
 end
