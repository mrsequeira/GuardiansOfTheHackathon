class DropReferenceFk < ActiveRecord::Migration[5.2]
  def change

    remove_reference :themes, :mentors, index: true

  end
end
