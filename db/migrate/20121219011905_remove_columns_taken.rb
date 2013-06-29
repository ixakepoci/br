class RemoveColumnsTaken < ActiveRecord::Migration
  def up
  	remove_column :invites, :taken
  end

  def down
  end
end
