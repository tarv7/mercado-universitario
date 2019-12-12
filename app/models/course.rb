class Course < ApplicationRecord
  has_many :college_has_courses, dependent: :destroy
  has_many :colleges, -> { distinct }, through: :college_has_courses

  enum shift: %i[morning evening nocturnal integral]

  validates :name, presence: true
  validates :shift, presence: true

  def self.shifts_for_select
    shifts.map do |shift, _|
      [I18n.t("order.shifts.#{shift}"), shift]
    end
  end
end
