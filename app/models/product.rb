class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :seller
  belongs_to :category

  has_many :order_products, dependent: :destroy

  scope :per_college, ->(user) do
    joins(seller: [user: [course: [:college]]])
      .where("colleges.id = #{user.college.id}")
  end

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 300 }
  validate :image_type

  def image_type
    errors.add(:image, 'is missing!') and return unless image.attached?

    errors.add(:image, 'needs to be a jpeg or png!') unless image
                                                            .content_type
                                                            .in?(%('image/jpeg
                                                                    image/png'))
  end
end
