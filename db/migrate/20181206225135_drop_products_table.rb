class DropProductsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :participants
    drop_table :teams
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
