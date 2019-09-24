class Category < ApplicationRecord
  has_many :sellers, dependent: :destroy

  validates :name, presence: true
end
