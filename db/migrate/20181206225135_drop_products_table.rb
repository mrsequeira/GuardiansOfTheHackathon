class DropProductsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :participants
    drop_table :teams
    drop_table :mentors
    drop_table :themes
    drop_table :team_themes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
