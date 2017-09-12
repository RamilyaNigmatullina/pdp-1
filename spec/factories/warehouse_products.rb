FactoryGirl.define do
  factory :warehouse_product do
    warehouse
    product
    amount Faker::Number.between(1, 50)
  end
end
