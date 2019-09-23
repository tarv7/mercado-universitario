# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    name { FFaker::AddressBR.state }
    abbreviation { FFaker::AddressBR.state_abbr }
  end
end
