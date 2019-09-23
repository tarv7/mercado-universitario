require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'product FactoryBot is valid' do
    product = build(:product)

    expect(product).to be_valid
  end

  it 'is invalid if name is not present' do
    product = build(:product, name: nil)

    expect(product).to be_invalid
  end

  describe 'price' do
    it 'is invalid if price is not present' do
      product = build(:product, price: nil)

      expect(product).to be_invalid
    end

    it 'is invalid if price is less than 0' do
      product = build(:product, price: -1)

      expect(product).to be_invalid
    end
  end

  it 'is invalid if description exceeds 300 characters' do
    product = build(:product, description: FFaker::Lorem.characters(301))

    expect(product).to be_invalid
  end
end
