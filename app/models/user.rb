class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :course

  has_many :order_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :seller, dependent: :destroy

  validates :name, presence: true
  validates :semester, numericality: { greater_than_or_equal_to: 1,
                                       only_integer: true }

  def seller?
    seller.present?
  end
end
