class Seller < ApplicationRecord
  belongs_to :user

  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy

  scope :per_university, ->(user) do
    joins(user: [course: [:university]])
      .where("universities.id = #{user.course.university.id}")
  end

  validates :name, presence: true
  validates :user, uniqueness: true
end
