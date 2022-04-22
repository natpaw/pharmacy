FactoryBot.define do
  factory :medicine do
    name { Faker::Cannabis.medical_use + Faker::Number.unique.number}
    price { Faker::Number.decimal }
	quantity{ Faker::Number.number }
	prescription {true}
	children {false}
  end
end
