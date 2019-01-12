class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :name_mentor, :string
    add_column :mentors, :vegan, :boolean
    add_column :mentors, :tshirt_size, :string
    add_column :mentors, :mentor_difficulties, :string
    add_column :mentors, :mentor_allergies, :string

    add_reference :mentors, :theme, index: true
    add_reference :mentors, :user, index: true

  end
end
