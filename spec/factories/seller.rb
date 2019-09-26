# frozen_string_literal: true

FactoryBot.define do
  factory :seller do
    name { FFaker::Company.name }

    association :user
  end
end
