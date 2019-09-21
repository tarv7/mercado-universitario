class Category < ApplicationRecord
    has_many :sellers

    validates :name, presence: true
end
