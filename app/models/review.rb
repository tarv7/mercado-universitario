class Review < ApplicationRecord
  belongs_to :seller
  belongs_to :user
end
