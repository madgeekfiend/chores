class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :chore_id
      t.integer :penalty_id

      t.timestamps
    end
  end
end
