FactoryBot.define do
  factory :prescription do
	number { 'РЛ125666' }
	exp_date { '2050-05-31' }
	children { false }
	quantity { Faker::Number.number(digits: 6) }
  end
end
