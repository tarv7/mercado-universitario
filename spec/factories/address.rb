# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { FFaker::Address.street_name }
    neighborhood { FFaker::Address.neighborhood }
    complement { FFaker::Address.secondary_address }
    number { rand(1..99) }

    association :city
    association :user
  end
end
