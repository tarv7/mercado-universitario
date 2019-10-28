# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    note { FFaker::Lorem.phrase }
    price { 50.0 }
    status { Order.statuses.keys.sample }
  end
end
