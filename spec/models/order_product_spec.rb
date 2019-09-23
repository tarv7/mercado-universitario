require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it 'order_product FactoryBot is valid' do
    order_product = build(:order_product)

    expect(order_product).to be_valid
  end

  describe 'quantity' do
    it 'is invalid if quantity is less than one' do
      order_product = build(:order_product, quantity: 0)

      expect(order_product).to be_invalid
    end

    it 'is invalid if quantity is not integer' do
      order_product = build(:order_product, quantity: 4.5)

      expect(order_product).to be_invalid
    end
  end
end
