FactoryGirl.define do
  factory :team do
    sequence(:name) {|n| "Team#{n}"}
    sequence(:odds) {|n| n} 
  end
end
