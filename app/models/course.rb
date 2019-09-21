class Course < ApplicationRecord
  belongs_to :university

  has_many :users
end
