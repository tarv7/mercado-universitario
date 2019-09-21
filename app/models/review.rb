class Review < ApplicationRecord
  belongs_to :seller
  belongs_to :user

  validates :value, presence: true, numericality: { only_integer: true }
  validates :comment, length: { maximum: 300 }
  validates :seller, uniqueness: { scope: [:user] }
end
