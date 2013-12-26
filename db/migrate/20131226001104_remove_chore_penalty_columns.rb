class RemoveChorePenaltyColumns < ActiveRecord::Migration
  def change
    remove_columns :lists, :penalty_id, :chore_id
  end
end
