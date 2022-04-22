FactoryBot.define do
  factory :item do
    name                  {Faker::Lorem.characters(number: 40)}
    info                  {Faker::Lorem.characters(number: 1000)}
    category_id           {1}
    condition_id          {1}
    shipping_day_id       {1}
    prefecture_id         {1}
    pay_for_sipping_id    {1}
    price                 {Faker::Number.between(from: 300) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
