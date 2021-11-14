require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should have_many(:user_team_players).dependent(:destroy) }
    it { should have_many(:user_teams).through(:user_team_players) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0).is_less_than(100) }
  end

  describe 'factories' do
    describe 'create(:player)' do
      subject(:player) { create(:player) }

      it 'creates a valid object' do
        expect(player).to be_valid
      end
    end

    describe 'create(:driver)' do
      subject(:driver) { create(:driver) }

      it 'creates a valid object' do
        expect(driver).to be_valid
        expect(driver.is_constructor).to eq(false)
      end
    end

    describe 'create(:constructor)' do
      subject(:constructor) { create(:constructor) }

      it 'creates a valid object' do
        expect(constructor).to be_valid
        expect(constructor.is_constructor).to eq(true)
      end
    end

    describe 'create(:cheap_driver)' do
      subject(:cheap_driver) { create(:cheap_driver) }

      it 'creates a valid object' do
        expect(cheap_driver).to be_valid
        expect(cheap_driver.is_constructor).to eq(false)
        expect(cheap_driver.price).to be >= 0.1
        expect(cheap_driver.price).to be <= 16.3
      end
    end

    describe 'create(:cheap_constructor)' do
      subject(:cheap_constructor) { create(:cheap_constructor) }

      it 'creates a valid object' do
        expect(cheap_constructor).to be_valid
        expect(cheap_constructor.is_constructor).to eq(true)
        expect(cheap_constructor.price).to be >= 0.1
        expect(cheap_constructor.price).to be <= 16.3
      end
    end
  end
end
