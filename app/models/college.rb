class College < ApplicationRecord
  belongs_to :address
  belongs_to :university

  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validates :university, uniqueness: { scope: [:name] }
end
