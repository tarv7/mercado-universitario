class Seller < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :orders
  has_many :reviews

  validates :name, presence: true
  validates :user, uniqueness: true
end
