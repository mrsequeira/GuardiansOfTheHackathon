class CreateTeamThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :team_themes do |t|
      t.references :teams, foreign_key: true
      t.references :themes, foreign_key: true
    end
  end
end
