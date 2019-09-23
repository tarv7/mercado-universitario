require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user FactoryBot is valid' do
    user = build(:user)

    expect(user).to be_valid
  end

  it 'is invalid if name is not present' do
    user = build(:user, name: nil)

    expect(user).to be_invalid
  end

  describe 'semester' do
    it 'is invalid if semester is not present' do
      user = build(:user, semester: nil)

      expect(user).to be_invalid
    end

    it 'is invalid if semester is not present' do
      user = build(:user, semester: nil)

      expect(user).to be_invalid
    end

    it 'is invalid if semester is less than 1' do
      user = build(:user, semester: 0)

      expect(user).to be_invalid
    end
  end
end
