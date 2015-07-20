FactoryGirl.define do
  factory :course do
    section { 3.times.map { (65 + rand(26)).chr }.join }
    number { ((rand(99) + 1) * 10).to_s }
    name 'Random General Course'
    description 'This is a random general course description for testing.'
    length ['30', '60', '90', '120'].sample
    # TODO Add user reference (wait until you've finished user factory and have :instructor trait)
  end
end