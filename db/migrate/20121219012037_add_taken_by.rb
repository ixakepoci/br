class AddTakenBy < ActiveRecord::Migration
  def up
  	add_column :invites, :taken_by, :integer
  end

  def down
  end
end
