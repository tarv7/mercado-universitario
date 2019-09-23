require 'rails_helper'

RSpec.describe Seller, type: :model do
  it 'seller FactoryBot is valid' do
    seller = build(:seller)

    expect(seller).to be_valid
  end

  it 'is invalid if name is not present' do
    seller = build(:seller, name: nil)

    expect(seller).to be_invalid
  end

  it 'is invalid if user is a already a seller' do
    user = create(:user)
    create(:seller, user: user)

    seller = build(:seller, user: nil)

    expect(seller).to be_invalid
  end
end
