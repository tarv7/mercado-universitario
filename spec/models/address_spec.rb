require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'address FactoryBot is valid' do
    address = build(:address)

    expect(address).to be_valid
  end

  it 'is invalid if street is not present' do
    address = build(:address, street: nil)

    expect(address).to be_invalid
  end

  it 'is invalid if neighborhood is not present' do
    address = build(:address, neighborhood: nil)

    expect(address).to be_invalid
  end

  describe 'number' do
    it 'is invalid if number is less than one' do
      address = build(:address, number: 0)

      expect(address).to be_invalid
    end

    it 'is invalid if number is not integer' do
      address = build(:address, number: 4.5)

      expect(address).to be_invalid
    end
  end
end
