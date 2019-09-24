class Course < ApplicationRecord
  belongs_to :university

  has_many :users, dependent: :destroy

  enum shift: %i[morning evening integral]

  validates :name, presence: true
  validates :shift, presence: true
  validates :university, uniqueness: { scope: %i[name shift] }
end
