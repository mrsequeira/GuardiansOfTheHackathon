class CreateMentor < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :name_mentor
      t.string :email_mentor
      t.string :password_mentor
      t.boolean :vegan
      t.string :tshirt_size
      t.string :mentor_difficulties
      t.string :mentor_allergies
    end
  end
end
  