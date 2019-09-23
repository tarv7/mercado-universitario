class Review < ApplicationRecord
  belongs_to :seller
  belongs_to :user

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 1,
                                                    less_than_or_equal_to: 5 }
  validates :comment, length: { maximum: 300 }
  validates :seller, uniqueness: { scope: [:user] }
end
