class College < ApplicationRecord
  belongs_to :address
  belongs_to :university

  has_many :college_has_courses, dependent: :destroy
  has_many :courses, -> { distinct }, through: :college_has_courses

  validates :name, presence: true
  validates :university, uniqueness: { scope: [:name] }
end
