require 'rails_helper'

feature "A user can pick two teams and get the odds of both of them being in the world series" do
  it "lets a user find the odds of two given teams playing in the world series" do
    team_1 = FactoryGirl.create(:team)
    team_2 = FactoryGirl.create(:team)

    combined_odds = team_1.odds * team_2.odds

    visit home_index_path

    find('#team1Seelect').find(:xpath, team_1.name).select_option
    find('#team1Seelect').find(:xpath, team_1.name).select_option

    expect(page).to_ have_content("#{combined_odds}/1")
  end
end
