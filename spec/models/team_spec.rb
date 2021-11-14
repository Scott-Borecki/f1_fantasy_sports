require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many(:players).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'factories' do
    describe 'create(:team)' do
      subject(:team) { create(:team) }

      it 'creates a valid object' do
        expect(team).to be_valid
      end
    end
  end
end
