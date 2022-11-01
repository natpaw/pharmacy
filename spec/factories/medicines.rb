FactoryBot.define do
  factory :medicine do
    name { Faker::Cannabis.unique.strain}
    price { Faker::Number.decimal }
	quantity{ 10 }
	prescription {false}
	children {false}
  end
end
