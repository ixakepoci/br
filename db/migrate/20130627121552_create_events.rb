class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :place_id
      t.string :name
      t.string :short_description
      t.string :expanded_description
      t.datetime :event_start
      t.datetime :event_end

      t.timestamps
    end
  end
end
