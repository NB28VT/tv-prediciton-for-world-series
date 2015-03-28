FactoryGirl.define do

  factory :league do
    sequence(:name) {|n| "Team#{n}"}
  end

  factory :team do
    sequence(:name) {|n| "Team#{n}"}
    sequence(:odds) {|n| n}
    league
  end
end
