class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :course
  belongs_to :address

  has_many :orders
  has_many :reviews
  has_one :seller

  validates :name, presence: true
  validates :semester, presence: true, numericality: { only_integer: true }

  accepts_nested_attributes_for :address, allow_destroy: false

  def seller?
    seller.present?
  end
end
