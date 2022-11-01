FactoryBot.define do
  factory :order do
	comment { Faker::Lorem.sentence }
	status { :fresh }
  end
end
