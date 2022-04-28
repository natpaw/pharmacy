FactoryBot.define do
  factory :medicine do
    name { Faker::Cannabis.unique.strain}
    price { Faker::Number.decimal }
	quantity{ Faker::Number.number(digits: 6) }
	prescription {true}
	children {true}
  end
end
