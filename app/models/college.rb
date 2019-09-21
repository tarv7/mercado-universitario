class College < ApplicationRecord
  belongs_to :address
  belongs_to :university

  validates :name, presence: true
  validates :university, uniqueness: { scope: [:name] }
end
