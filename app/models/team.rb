class Team < ActiveRecord::Base
  belongs_to :league
  def self.combined_odds(team_1, team_2)
    team_1.odds * team_2.odds
  end
end
