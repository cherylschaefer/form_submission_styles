FactoryGirl.define do

  factory :user do
    sequence(:email) { |i| "user{i}@something.com" }
    password "12345678"
  end
end
