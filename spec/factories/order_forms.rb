FactoryBot.define do
  factory :order_form do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code   { "111-1111" }
    prefecture_id { 2 + Faker::Number.digit }
    municipality  { "市区町村" }
    address       { "番地" }
    building      { "建物名" }
    telephone     { "01011112222" }
  end
end