FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end

def user_with_a_team
  FactoryBot.create(:user) do |user|
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
end
