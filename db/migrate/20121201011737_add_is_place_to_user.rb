class AddIsPlaceToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_place, :boolean
    add_column :users, :place_id, :integer
  end
end
