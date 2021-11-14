FactoryBot.define do
  factory :player do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    price { rand(0.1...99.9) }
    is_constructor { false }
    team
  end
end
