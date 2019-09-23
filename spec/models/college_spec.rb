require 'rails_helper'

RSpec.describe College, type: :model do
  it 'college FactoryBot is valid' do
    college = build(:college)

    expect(college).to be_valid
  end

  it 'name is invalid if is not present' do
    college = build(:college, name: nil)

    expect(college).to be_invalid
  end

  it 'is invalid if there is already a set name, university in database' do
    university = create(:university)
    name = 'Campus Soane Nazaré de Andrade'

    create(:college, name: name, university: university)

    college = build(:college, name: name, university: university)
    expect(college).to be_invalid
  end
end
