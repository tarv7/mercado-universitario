class Course < ApplicationRecord
  belongs_to :university

  has_many :users

  validates :name, presence: true
  validates :shift, presence: true, numericality: { only_integer: true }
  validates :university, uniqueness: { scope: %i[name shift] }
end
