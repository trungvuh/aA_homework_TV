class ChangeUniquenessonToy < ActiveRecord::Migration[5.1]
  def change
    remove_index :toys, :name
    add_index :toys, :name
  end
end
