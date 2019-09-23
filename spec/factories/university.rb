# frozen_string_literal: true

FactoryBot.define do
  factory :university do
    name { FFaker::Education.school }
    abbreviation { FFaker::Education.school_name }
  end
end
