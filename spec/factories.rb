FactoryGirl.define do

  sequence(:email) { |n| "testing#{n}@example.com" }

  factory :user do
    email
  end
end
