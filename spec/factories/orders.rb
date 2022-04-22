FactoryBot.define do
  factory :order do
	pharmacist_id { 1 }
    total { Faker::Number.decimal }
	comment { Faker::Lorem.sentence }
	status { 0 }
  end
end
