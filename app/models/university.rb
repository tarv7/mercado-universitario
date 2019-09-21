class University < ApplicationRecord
    has_many :colleges
    has_many :courses
end
