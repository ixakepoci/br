class AddIsValidToInvites < ActiveRecord::Migration
  def up
  	add_column :invites, :is_valid, :boolean
  end
end
