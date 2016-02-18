FactoryGirl.define do

  factory :comment do
    body "This is a comment body."
    author
    post
  end
end

#In the code review, kelsey had commentable type included here...neeeded?