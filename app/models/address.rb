class Address < ApplicationRecord
  belongs_to :city

  has_many :users
  has_many :colleges

  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :number, numericality: { greater_than_or_equal_to: 1,
                                     only_integer: true }
end
