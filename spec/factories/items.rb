FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    introduction { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 3 }
    postage_id { 2 }
    shipping_area_id { 10 }
    shipping_days_id { 3 }
    price { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
