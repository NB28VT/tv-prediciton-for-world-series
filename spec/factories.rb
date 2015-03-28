FactoryGirl.define do

  factory :league do
    sequence(:name) {|n| "Team#{n}"}
  end

  factory :team do
    sequence(:name) {|n| "Team#{n}"}
    sequence(:odds) {|n| n}
    league
    sequence(:one_to_four_viewership) {|n| n.to_f}
    sequence(:game_five_viewership) {|n| n.to_f}
    sequence(:game_six_viewership) {|n| n.to_f}
    sequence(:game_seven_viewership) {|n| n.to_f}
  end
end
