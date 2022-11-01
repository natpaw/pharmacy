FactoryBot.define do
  factory :doctor do
	first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
	password { 123 }
  end
end
