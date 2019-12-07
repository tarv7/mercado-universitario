class University < ApplicationRecord
  has_many :colleges, dependent: :destroy

  validates :name, presence: true
  validates :abbreviation, presence: true
end
