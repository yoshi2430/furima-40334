FactoryBot.define do
  factory :purchase_shipping_address do
      postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" } 
      prefecture_id { Faker::Number.between(from: 1, to: 47) } 
      city { Faker::Address.city } 
      address_line1 { Faker::Address.street_address } 
      address_line2 { Faker::Address.secondary_address } 
      phone_number { Faker::PhoneNumber.subscriber_number(length: 10) + Faker::PhoneNumber.subscriber_number(length: 1) }
      token {"tok_abcdefghijk00000000000000000"}
  end
end
