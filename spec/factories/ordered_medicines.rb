FactoryBot.define do
  factory :ordered_medicine do
	quantity { Faker::Number.number(digits: 6) }
	presc_number { 'РЛ125666' }
  end
end
