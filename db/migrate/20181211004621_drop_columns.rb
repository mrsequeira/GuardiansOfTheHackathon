class DropColumns < ActiveRecord::Migration[5.2]
  def change

    remove_column :mentors, :email_mentor
    remove_column :mentors, :password_mentor

    remove_foreign_key :themes, :mentors
    
  end
end
