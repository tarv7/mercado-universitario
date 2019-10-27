class Seller < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy

  scope :per_university, ->(user) do
    joins(user: [course: [:university]])
      .where("universities.id = #{user.course.university.id}")
  end

  validates :name, presence: true
  validates :user, uniqueness: true
  validate :image_type

  def image_type
    errors.add(:image, 'is missing!') and return unless image.attached?

    errors.add(:image, 'needs to be a jpeg or png!') unless image
                                                            .content_type
                                                            .in?(%('image/jpeg
                                                                    image/png'))
  end
end
