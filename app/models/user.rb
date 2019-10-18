class User < ApplicationRecord
  attr_accessor :university_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :course

  has_many :addresses, inverse_of: :user, dependent: :nullify
  has_many :order_products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :seller, dependent: :destroy

  delegate :university, to: :course

  validates :name, presence: true
  validates :semester, numericality: { greater_than_or_equal_to: 1,
                                       only_integer: true }

  accepts_nested_attributes_for :addresses, reject_if: :all_blank,
                                            allow_destroy: true

  def seller?
    seller.present?
  end
end
