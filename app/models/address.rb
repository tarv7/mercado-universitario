class Address < ApplicationRecord
  belongs_to :city

  has_many :users
  has_many :colleges

  validates :street, presence: true
  validates :neigborhood, presence: true
  validates :number, numericality: { only_integer: true }
end
