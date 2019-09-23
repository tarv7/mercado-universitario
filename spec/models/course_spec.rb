require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'course FactoryBot is valid' do
    course = build(:course)

    expect(course).to be_valid
  end

  it 'name is invalid if is not present' do
    course = build(:course, name: nil)

    expect(course).to be_invalid
  end

  it 'shift is invalid if is not present' do
    course = build(:course, shift: nil)

    expect(course).to be_invalid
  end

  it 'is invalid if there is already a set university,name,shift in database' do
    university = create(:university)
    name = FFaker::Education.major
    shift = %w[morning evening integral].sample

    create(:course, name: name, university: university, shift: shift)

    course = build(:course, name: name, university: university, shift: shift)
    expect(course).to be_invalid
  end
end
