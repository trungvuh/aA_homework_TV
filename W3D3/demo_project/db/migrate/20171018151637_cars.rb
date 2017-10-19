class Cars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :type
      t.string :model
      t.integer :person_id
      t.timestamps
    end
  end
end
