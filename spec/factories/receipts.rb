FactoryGirl.define do
  factory :receipt do
    association :contract
    goal "entrega"
  end
end
