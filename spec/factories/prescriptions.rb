FactoryBot.define do
  factory :prescription do
	number { 'РЛ125666' }
	exp_date { '2022-05-31' }
	children { true }
	quantity { Faker::Number.number(digits: 6) }
  end
end
