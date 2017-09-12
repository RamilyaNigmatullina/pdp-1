FactoryGirl.define do
  factory :product do
    title { Faker::Lorem.word }
  end
end
