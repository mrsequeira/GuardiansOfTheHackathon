class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :project
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
