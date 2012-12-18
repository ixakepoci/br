class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :vicinity
      t.string :type
      t.string :formatted_address
      t.string :phone
      t.string :latlng
      t.float :rating
      t.string :url
      t.string :icon
      t.string :html_attributions
      t.string :reference
      t.string :unique_google_id

      t.timestamps
    end
  end
end
