require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'review FactoryBot is valid' do
    review = build(:review)

    expect(review).to be_valid
  end

  describe 'value' do
    it 'is invalid if value is not present' do
      review = build(:review, value: nil)

      expect(review).to be_invalid
    end
    it 'is invalid if value is not range 1..5' do
      review = build(:review, value: 6)

      expect(review).to be_invalid
    end
  end

  it 'is invalid if comment exceeds 300 characters' do
    review = build(:review, comment: FFaker::Lorem.characters(301))

    expect(review).to be_invalid
  end

  it 'is invalid if there is already a set seller,user in database' do
    seller = create(:seller)
    user = create(:user)
    create(:review, user: user, seller: seller)

    review = build(:review, user: user, seller: seller)
    expect(review).to be_invalid
  end
end
