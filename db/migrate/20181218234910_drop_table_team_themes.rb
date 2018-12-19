class DropTableTeamThemes < ActiveRecord::Migration[5.2]
  def change
    drop_table :team_themes
  end
end
