FactoryBot.define do
  factory :order do
    total { Faker::Number.decimal }
	comment { Faker::Lorem.sentence }
	pending
  end
end
