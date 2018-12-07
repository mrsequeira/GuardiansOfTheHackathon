class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :vegan
      t.string :tshirt_size
      t.string :motor_difficulties
      t.string :allergies
      t.boolean :caption
      t.string :phone
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
