class Address < ApplicationRecord
  belongs_to :city

  has_many :users
  has_many :colleges
end
