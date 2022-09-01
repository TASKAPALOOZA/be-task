require 'rails_helper'

RSpec.describe DeptManager, type: :model do
  describe 'relationships' do
    it { should belong_to(:manager) }
    it { should belong_to(:department) }
  end
end