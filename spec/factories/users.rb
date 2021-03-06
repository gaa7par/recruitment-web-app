FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@app.com" }
    password 'secret'
    password_confirmation 'secret'

    trait :admin do
      admin true
    end
  end
end
