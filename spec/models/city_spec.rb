require 'rails_helper'

RSpec.describe City, type: :model do
  it 'city FactoryBot is valid' do
    city = build(:city)

    expect(city).to be_valid
  end

  it 'name is invalid if is not present' do
    city = build(:city, name: nil)

    expect(city).to be_invalid
  end

  it 'is invalid if there is already a set name, state in database' do
    state = create(:state)
    name = 'Ilheus'

    create(:city, name: name, state: state)

    city = build(:city, name: name, state: state)
    expect(city).to be_invalid
  end
end
