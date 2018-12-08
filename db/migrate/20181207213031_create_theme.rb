class CreateTheme < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name_theme
      t.string :description_theme
      t.references :mentors, foreign_key: true
    end
  end
end
