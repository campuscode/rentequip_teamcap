FactoryGirl.define do
  factory :price do
    association :equipment
    deadline 3
    value 1.5
  end
end
