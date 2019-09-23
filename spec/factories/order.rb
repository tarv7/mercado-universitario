# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    note { FFaker::Lorem.paragraph }
    status { Order.statuses.keys.sample }

    association :user
    association :seller
  end
end
