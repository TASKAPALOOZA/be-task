require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'relationships' do
    it { should have_many(:dept_managers) }
    it { should have_many(:departments).through(:dept_managers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }

  end
end