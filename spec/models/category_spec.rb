require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'category FactoryBot is valid' do
    category = build(:category)

    expect(category).to be_valid
  end

  it 'is invalid if name is not present' do
    category = build(:category, name: nil)

    expect(category).to be_invalid
  end
end
