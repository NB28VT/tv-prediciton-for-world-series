class HomeController < ApplicationController
    def index
      if params[:team1] && params[:team2] && params[:game_count]
        @team_1 = Team.find(params[:team1][:team_id].to_i)
        @team_2 = Team.find(params[:team2][:team_id].to_i)
        @combined_odds = Team.combined_odds(@team_1, @team_2)
        @viewership = Team.combined_viewership(@team_1, @team_2, params[:game_count])
      end
    end
end
