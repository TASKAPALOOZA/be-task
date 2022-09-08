require 'rails_helper'

RSpec.describe Assignment do
  describe 'relationships' do
    it { should belong_to(:task) }
    it { should belong_to(:employee) }
  end
end
