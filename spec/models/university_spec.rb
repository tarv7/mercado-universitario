require 'rails_helper'

RSpec.describe University, type: :model do
  it 'university FactoryBot is valid' do
    university = build(:university)

    expect(university).to be_valid
  end

  it 'university is invalid if name is not present' do
    university = build(:university, name: nil)

    expect(university).to be_invalid
  end

  it 'university is invalid if abbreviation is not present' do
    university = build(:university, abbreviation: nil)

    expect(university).to be_invalid
  end
end
