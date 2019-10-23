# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    price { rand(10.5..99.0).round(2) }
    description { FFaker::Lorem.paragraph }

    association :seller
    association :category

    after(:build) do |product|
      product.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpeg')), filename: 'test.jpeg')
    end
  end
end
