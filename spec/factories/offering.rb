FactoryGirl.define do
  factory :offering do
    course
    size 10
    scheduled_at { Date.today + (rand(7) + 1).days + rand(24).hours }
    location 'Test location'
    # TODO Add user reference (wait until you've finished user factory and have :instructor trait)
    signed_up 0

    trait :full do
      signed_up 10
    end
  end
end