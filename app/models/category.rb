class Category < ApplicationRecord
  has_one_attached :image

  has_many :products, dependent: :destroy

  validates :name, presence: true
  validate :image_type

  def image_type
    errors.add(:image, 'is missing!') and return unless image.attached?

    errors.add(:image, 'needs to be a jpeg or png!') unless image
                                                            .content_type
                                                            .in?(%('image/jpeg
                                                                    image/png'))
  end
end
