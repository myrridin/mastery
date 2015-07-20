FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "testuser#{n}@test.com"
    end
    name 'Test User'

    trait :instructor do
      instructor_flag true
    end

    trait :admin do
      admin_flag true
    end
  end
end