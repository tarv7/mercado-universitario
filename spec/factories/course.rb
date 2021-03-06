# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { FFaker::Education.major }
    shift { %w[morning evening integral].sample }
  end
end
