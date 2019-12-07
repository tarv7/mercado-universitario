FactoryBot.define do
  factory :college_has_course do
    association :college
    association :course
  end
end
