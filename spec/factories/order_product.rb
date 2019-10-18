# frozen_string_literal: true

FactoryBot.define do
  factory :order_product do
    quantity { rand(1..9) }

    association :product
    association :order
    association :user
  end
end
