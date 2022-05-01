FactoryBot.define do
  factory :order do
    total { Faker::Number.decimal }
	comment { Faker::Lorem.sentence }
	status { :pending }
  end
end
