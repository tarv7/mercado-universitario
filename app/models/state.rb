class State < ApplicationRecord
  has_many :cities, inverse_of: true, dependent: :destroy

  validates :name, presence: true
  validates :abbreviation, presence: true, length: { is: 2 }
end
