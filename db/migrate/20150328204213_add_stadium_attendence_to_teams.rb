class AddStadiumAttendenceToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :attendence, :integer
  end

  def down
    remove_column :teams, :attendence
  end
end
