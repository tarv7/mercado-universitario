# frozen_string_literal: true

FactoryBot.define do
  factory :seller do
    name { FFaker::Company.name }

    association :user

    after(:build) do |seller|
      seller.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpeg')), filename: 'test.jpeg')
    end

    trait :with_image do
      image { fixture_file_upload(Rails.root.join('spec', 'factories', 'images', 'test.jpeg'), 'image/jpeg') }
    end
  end
end
