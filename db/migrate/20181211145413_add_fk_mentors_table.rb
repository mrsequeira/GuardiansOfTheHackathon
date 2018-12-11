class AddFkMentorsTable < ActiveRecord::Migration[5.2]
  def change

    add_reference :mentors, :theme, index: true
    add_reference :mentors, :user, index: true
  end
end
