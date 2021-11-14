FactoryBot.define do
  factory :user_team do
    name { Faker::Team.name }
    user
  end
end
