class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.belongs_to :lists
      t.string :name
      t.decimal :amount, :default => 0.00
      t.integer :list_id

      t.timestamps
    end
  end
end
