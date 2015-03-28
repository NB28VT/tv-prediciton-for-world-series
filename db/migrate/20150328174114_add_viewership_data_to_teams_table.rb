class AddViewershipDataToTeamsTable < ActiveRecord::Migration
  def up
    add_column :teams, :one_to_four_viewership, :float
    add_column :teams, :game_five_viewership, :float
    add_column :teams, :game_six_viewership, :float
    add_column :teams, :game_seven_viewership, :float
  end

  def down
    remove_column :teams, :one_to_four_viewership
    remove_column :teams, :game_five_viewership
    remove_column :teams, :game_six_viewership
    remove_column :teams, :game_seven_viewership
  end
end
