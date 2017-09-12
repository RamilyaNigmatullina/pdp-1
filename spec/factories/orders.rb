FactoryGirl.define do
  factory :order do
    warehouse
    product
    amount Faker::Number.between(1, 50)
  end
end
