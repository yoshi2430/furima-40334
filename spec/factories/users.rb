FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2 ) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2023-12-31')}
  end
end