require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'order FactoryBot is valid' do
    order = build(:order)

    expect(order).to be_valid
  end

  it 'is invalid if note exceeds 300 characters' do
    order = build(:order, note: FFaker::Lorem.characters(301))

    expect(order).to be_invalid
  end
end
