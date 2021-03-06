class OrderProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :user

  validates :quantity, presence: true,
                       numericality: { greater_than_or_equal_to: 1,
                                       only_integer: true }
end
