FactoryBot.define do
  factory :user_team do
    name { Faker::Team.name }
    user
  end
end

def create_valid_user_team(user)
  FactoryBot.create(:user_team, user: user) do |user_team|
    driver1 = FactoryBot.create(:cheap_driver)
    driver2 = FactoryBot.create(:cheap_driver)
    driver3 = FactoryBot.create(:cheap_driver)
    driver4 = FactoryBot.create(:cheap_driver)
    driver5 = FactoryBot.create(:cheap_driver)
    constructor = FactoryBot.create(:cheap_constructor)

    FactoryBot.create(:user_team_player, user_team: user_team, player: driver1)
    FactoryBot.create(:user_team_player, user_team: user_team, player: driver2)
    FactoryBot.create(:user_team_player, user_team: user_team, player: driver3)
    FactoryBot.create(:user_team_player, user_team: user_team, player: driver4)
    FactoryBot.create(:user_team_player, user_team: user_team, player: driver5)
    FactoryBot.create(:user_team_player, user_team: user_team, player: constructor)
  end
end
