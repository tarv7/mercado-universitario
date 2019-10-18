class Address < ApplicationRecord
  belongs_to :city
  belongs_to :user

  has_many :colleges, dependent: :destroy

  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :number, allow_nil: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1 }
end
