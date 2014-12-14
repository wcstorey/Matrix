copied_pw = Faker::Internet.password
FactoryGirl.define do
  factory :category do
    name Faker::Lorem.word
  end

  factory :post do
    title Faker::Lorem.word
    content Faker::Lorem.sentence
  end

  factory :user do
    username Faker::Internet.user_name
    email Faker::Internet.email
    password copied_pw
    password_confirmation copied_pw
  end
end
