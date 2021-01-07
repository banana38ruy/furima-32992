FactoryBot.define do
  factory :item do
    name                       {Faker::Lorem.sentence}
    expranation                {Faker::Lorem.sentence}
    category_id                {3}
    price                      {777}
    quality_id                 {3}
    delivery_burden_id         {3}
    prefecture_id              {3}
    shipping_id                {3}
    association              :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'text_image.png')
    end
  end
end
