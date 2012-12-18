class AddIncompleteToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :incomplete, :boolean
  end
end
