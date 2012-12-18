class AddTakenToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :taken, :boolean
  end
end
