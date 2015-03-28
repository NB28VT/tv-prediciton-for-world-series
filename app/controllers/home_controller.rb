class HomeController < ApplicationController
    def index
      if (params[:team1] != nil && params[:team2] != nil)
        @team_1 = Team.find(params[:team1][:team_id].to_i)
        @team_2 = Team.find(params[:team2][:team_id].to_i)
        @combined_odds = Team.combined_odds(@team_1, @team_2)
        @four_game_viewership = Team.combined_viewership(@team_1, @team_2, 4)
        @five_game_viewership = Team.combined_viewership(@team_1, @team_2, 5)
        @six_game_viewership = Team.combined_viewership(@team_1, @team_2, 6)
        @seven_game_viewership = Team.combined_viewership(@team_1, @team_2, 7)
        @team_1_logo = Team.logo_helper(@team_1)
        @team_2_logo = Team.logo_helper(@team_2)
        @four_game_attendance = Team.game_attendence(@team_1, @team_2, 4)
        @five_game_attendance = Team.game_attendence(@team_1, @team_2, 5)
        @six_game_attendance = Team.game_attendence(@team_1, @team_2, 6)
        @seven_game_attendance = Team.game_attendence(@team_1, @team_2, 7)
      end
    end
end
