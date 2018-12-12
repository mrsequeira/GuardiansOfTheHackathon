class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.boolean :vegan
      t.string :tshirt_size
      t.string :motor_difficulties
      t.string :allergies
      t.boolean :leader
      t.string :phone
      t.string :course
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
