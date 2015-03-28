FactoryGirl.define do  factory :league do
    
  end

  factory :team do
    sequence(:name) {|n| "Team#{n}"}
    sequence(:odds) {|n| n} 
  end
end
