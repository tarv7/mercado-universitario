class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :course
  belongs_to :address

  has_many :order_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :seller, dependent: :destroy

  validates :name, presence: true
  validates :semester, presence: true,
                       numericality: { greater_than_or_equal_to: 1,
                                       only_integer: true }

  accepts_nested_attributes_for :address, allow_destroy: false

  def seller?
    seller.present?
  end
end
