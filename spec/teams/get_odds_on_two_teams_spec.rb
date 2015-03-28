require 'rails_helper'

feature "A user can pick two teams and get the odds of both of them being in the world series" do

  before(:each) do
    national_league = FactoryGirl.create(:league, name: "National")
    american_league = FactoryGirl.create(:league, name: "American")
    @team_1 = FactoryGirl.create(:team, league: national_league)
    @team_2 = FactoryGirl.create(:team, league: american_league)
  end

  it "returns likely viewership figures" do
    likely_viewership = (
      @team_1.one_to_four_viewership +
      @team_2.one_to_four_viewership
      )/2
    visit home_index_path

    select @team_1.name, from: 'team1_team_id'
    select @team_2.name, from: 'team2_team_id'
    click_on "Submit"

    expect(page).to have_content(likely_viewership)
  end


end
