FactoryBot.define do
  factory :user do
    attendance       { '出席' }
    name             { '山田花子' }
    name_kana        { 'ヤマダハナコ' }
    bride_groom      { '新婦ゲスト' }
    email            { Faker::Internet.free_email }
    postal_code      { '123-4567' }
    prefecture_code  { '広島県' }
    city             { '広島市' }
    address          { '中区1-1' }
    building         { Faker::Address.street_address }
    admin            { Faker::Boolean.boolean }
  end
end
