# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.email }
    password { FFaker::Lorem.characters(8) }
    semester { rand(1..10) }
    confirmed_at { DateTime.now }

    association :college_has_course
  end
end
