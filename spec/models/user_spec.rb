require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factories' do
    describe 'create user' do
      subject(:user) { create(:user) }

      it 'creates a valid object' do
        expect(user).to be_valid
      end
    end
  end
end
