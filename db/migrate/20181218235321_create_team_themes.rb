class CreateTeamThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :team_themes do |t|
      t.references :team, foreign_key: true
      t.references :themes, foreign_key: true

      t.timestamps
    end
  end
end
