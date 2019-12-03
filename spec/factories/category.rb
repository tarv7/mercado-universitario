# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.word }

    after(:build) do |category|
      category.image.attach(
        io: File.open(Rails.root
                           .join('spec', 'factories', 'images', 'test.jpeg')),
        filename: 'test.jpeg'
      )
    end
  end
end
