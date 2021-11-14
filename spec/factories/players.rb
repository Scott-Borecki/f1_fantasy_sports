FactoryBot.define do
  factory :player do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    price { rand(0.1...99.9) }
    is_constructor { [true, false].sample }
    team

    factory :driver do
      is_constructor { false }
    end

    factory :constructor do
      is_constructor { true }
    end

    factory :cheap_driver do
      price { rand(0.1...16.33) }
      is_constructor { false }
    end

    factory :cheap_constructor do
      price { rand(0.1...16.33) }
      is_constructor { true }
    end
  end
end
