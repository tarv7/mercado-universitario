# frozen_string_literal: true

FactoryBot.define do
  factory :college do
    name { FFaker::Education.school }

    association :address
    association :university
  end
end
