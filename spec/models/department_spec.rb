require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'relationships' do
    it { should have_many(:dept_managers) }
    it { should have_many(:managers).through(:dept_managers) }
    it { should have_many(:employees) }
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
