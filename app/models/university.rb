class University < ApplicationRecord
  has_many :colleges
  has_many :courses

  validates :name, presence: true
  validates :abbreviation, presence: true
end
