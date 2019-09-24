class Seller < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :user, uniqueness: true
end
