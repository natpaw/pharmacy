FactoryBot.define do
  factory :pharmacist do
    association :user_id, factory: :user
  end
end
