# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.word }
    image { 'categories/comidas.jpg' }
  end
end
