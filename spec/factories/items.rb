FactoryBot.define do
  factory :item do
     
    name { Faker::Commerce.product_name }  
    description { Faker::Lorem.paragraph }  
    category_id { Faker::Number.between(from: 2, to: 10) }  
    condition_id { Faker::Number.between(from: 2, to: 7) }  
    shipping_fee_burden_id { Faker::Number.between(from: 2, to: 3) }  
    prefecture_id { Faker::Number.between(from: 2, to: 10) }  
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }  
    price { Faker::Number.between(from: 300, to: 9_999_999) } 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
    association :user 
  end
end
