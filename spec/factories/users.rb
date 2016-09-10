FactoryGirl.define do
  factory :user do
    name { generate :name }
    email { generate :email }
    password { generate :password }
  end
end
