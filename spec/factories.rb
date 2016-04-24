FactoryGirl.define do

  factory :user do
    sequence(:email) { |i| "user#{i}@something.com" }
    password "12345678"
  end

  factory :tribble do
    sequence(:name) { |i| "tribble#{i}" }
    user { create(:user) }
  end
  
  factory :snowflake do
    sequence(:name) { |i| "snowflake#{i}" }
    user { create(:user) }
  end
  
  factory :putty do
    name "Squishy Putty"
    user { create(:user) }
  end
  
  factory :diamond do
    name "Sparkly Diamond"
    user { create(:user) }
  end
end
