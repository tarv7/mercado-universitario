require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'order FactoryBot is valid' do
    order = build(:order)

    expect(order).to be_valid
  end

  describe 'note' do
    it 'is invalid if note is not present' do
      order = build(:order, note: nil)

      expect(order).to be_invalid
    end

    it 'is invalid if note exceeds 300 characters' do
      order = build(:order, note: FFaker::Lorem.characters(301))

      expect(order).to be_invalid
    end
  end

  it 'is invalid if status is not present' do
    order = build(:order, status: nil)

    expect(order).to be_invalid
  end
end
