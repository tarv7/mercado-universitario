class Order < ApplicationRecord
  belongs_to :seller
  belongs_to :user

  has_many :order_products

  enum status: %i[not_seen preparing on_the_way delivered canceled]

  validates :note, presence: true, length: { maximum: 300 }
  validates :status, presence: true
end
