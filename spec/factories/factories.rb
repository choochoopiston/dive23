FactoryGirl.define do
  sequence(:id) { Faker::Number.between(1, 99) }
  sequence(:name) { Faker::Name.name }
  sequence(:email) { Faker::Internet.email }
  sequence(:password) { Faker::Internet.password(8,10) }
end