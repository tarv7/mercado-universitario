class City < ApplicationRecord
  belongs_to :state

  has_many :addresses, dependent: :destroy

  validates :name, presence: true
  validates :state, uniqueness: { scope: [:name] }
end
