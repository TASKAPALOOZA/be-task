require 'rails_helper'

RSpec.describe Employee do
  describe 'relationships' do
    it { should belong_to(:department) }
    it { should have_many(:assignments) }
    it { should have_many(:tasks).through(:assignments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end
end
