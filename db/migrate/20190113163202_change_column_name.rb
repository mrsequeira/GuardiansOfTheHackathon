class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_themes, :themes_id, :theme_id
  end
end
