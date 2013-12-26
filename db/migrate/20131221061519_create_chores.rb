class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.belongs_to :lists
      t.string :name
      t.boolean :isDone, :default => false
      t.integer :list_id

      t.timestamps
    end
  end
end
