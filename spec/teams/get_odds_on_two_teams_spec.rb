require 'rails_helper'

feature "A user can pick two teams and get the odds of both of them being in the world series" do
  it "lets a user find the odds of two given teams playing in the world series" do
    national_league = FactoryGirl.create(:league, name: "National")
    american_league = FactoryGirl.create(:league, name: "American")
    team_1 = FactoryGirl.create(:team, league: national_league)
    team_2 = FactoryGirl.create(:team, league: american_league)

    combined_odds = team_1.odds * team_2.odds

    visit home_index_path

    select team_1.name, from: 'team1_team_id'
    select team_2.name, from: 'team2_team_id'
    click_on "Submit"

    expect(page).to have_content("#{combined_odds}/1")
  end
end
