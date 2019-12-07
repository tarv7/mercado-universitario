class CollegeHasCourse < ApplicationRecord
  belongs_to :college
  belongs_to :course
end
