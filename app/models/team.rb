class Team < ActiveRecord::Base
  belongs_to :league

  def self.logo_helper(team)
    filename = team.name.downcase.gsub(' ', '-')
    "#{filename}.svg"
  end


  def self.combined_odds(team_1, team_2)
    team_1.odds * team_2.odds
  end

  # Find average between viewerships
  def self.combined_viewership(team_1, team_2, game)

    if game == 4
      team_1_viewership = team_1.one_to_four_viewership
      team_2_viewership = team_2.one_to_four_viewership
    elsif game == 5
      team_1_viewership = team_1.game_five_viewership
      team_2_viewership = team_2.game_five_viewership
    elsif game == 6
      team_1_viewership = team_1.game_six_viewership
      team_2_viewership = team_2.game_six_viewership
    elsif game == 7
      team_1_viewership = team_1.game_seven_viewership
      team_2_viewership = team_2.game_seven_viewership
    end

    (((team_1_viewership) + (team_2_viewership))/2).round(2)
  end

  def self.game_attendence(team_1, team_2, game)
    if game == 4
      (team_1.attendence * 2) + (team_1.attendence * 2)
    elsif game == 5
      (team_1.attendence * 3) + (team_1.attendence * 2)
    elsif game == 6
      (team_1.attendence * 3) + (team_1.attendence * 3)
    elsif game == 7
      (team_1.attendence * 4) + (team_1.attendence * 3)
    end
  end
end
