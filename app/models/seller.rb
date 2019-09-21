class Seller < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :orders
  has_many :reviews

  validates :user, uniqueness: true
end
