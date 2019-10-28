# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    value { rand(1..5) }
    comment { FFaker::Lorem.phrase }

    association :seller
    association :user
  end
end
