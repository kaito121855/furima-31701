FactoryBot.define do
  factory :product do
    name        { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { 2 + Faker::Number.digit }
    status_id   { 2 + Faker::Number.digit }
    burden_id   { 2 + Faker::Number.digit }
    area_id     { 2 + Faker::Number.digit }
    day_id      { 2 + Faker::Number.digit }
    price       { 300 + Faker::Number.digit }
    association :user
  end
end
