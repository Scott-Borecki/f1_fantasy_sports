require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factories' do
    describe 'create(:user)' do
      subject(:user) { create(:user) }

      it 'creates a valid object' do
        expect(user).to be_valid
      end
    end

    describe 'validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:username) }
      it { should validate_uniqueness_of(:username) }
      it { should validate_presence_of(:password) }
      it { should validate_confirmation_of(:password) }
      it { should validate_length_of(:password).is_at_most(72) }
      it { should validate_presence_of(:password_confirmation) }
    end
  end
end