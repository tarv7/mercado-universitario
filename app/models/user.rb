class User < ApplicationRecord
  has_one_attached :image

  attr_accessor :university_id
  attr_accessor :college_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  belongs_to :college_has_course, optional: true

  has_many :addresses, inverse_of: :user, dependent: :nullify
  has_many :order_products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :seller, dependent: :destroy

  delegate :course, to: :college_has_course
  delegate :college, to: :college_has_course

  validates :name, presence: true
  validates :semester, numericality: { greater_than_or_equal_to: 1,
                                       only_integer: true }
  validate :image_type

  def image_type
    return unless image.attached?

    errors.add(:image, 'needs to be a jpeg or png!') unless image
                                                            .content_type
                                                            .in?(%('image/jpeg
                                                                    image/png'))
  end

  accepts_nested_attributes_for :addresses, reject_if: :all_blank,
                                            allow_destroy: true

  def seller?
    seller.present?
  end
end
