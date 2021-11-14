FactoryBot.define do
  factory :team do
    name { Faker::Vehicle.manufacture }
  end
end
