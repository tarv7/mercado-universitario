require 'rails_helper'

RSpec.describe State, type: :model do
  it 'state FactoryBot is valid' do
    state = build(:state)

    expect(state).to be_valid
  end

  it 'state is invalid if name is not present' do
    state = build(:state, name: nil)

    expect(state).to be_invalid
  end

  describe 'abbreviation' do
    it 'state is invalid if abbreviation is not present' do
      state = build(:state, abbreviation: nil)

      expect(state).to be_invalid
    end

    it 'state is invalid if size abbreviation is not 2' do
      state = build(:state, abbreviation: 'BAH')

      expect(state).to be_invalid
    end
  end
end
