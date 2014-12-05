FactoryGirl.define do
  factory :user do
    email { sequence "john.doe#{n}@example.com" }
    password '12345678'
  end
end
