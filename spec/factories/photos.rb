FactoryBot.define do
  factory :photo do
    text       { Faker::Lorem.sentence }
    association :user

    after(:build) do |photo|
      photo.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
