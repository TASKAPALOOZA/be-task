require 'rails_helper'

RSpec.describe Task do
  describe 'relationships' do
    it { should belong_to(:department) }
    it { should have_many(:assignments) }
    it { should have_many(:employees).through(:assignments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:scope) }
    it { should define_enum_for(:scope).with_values(['ASAP', 'Daily', 'Weekly']) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:status) }
    it { should define_enum_for(:status).with_values(['Created', 'Assigned', 'In Progress', 'Completed']) }
  end
end
