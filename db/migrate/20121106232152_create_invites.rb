class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :content
      t.integer :place_id

      t.timestamps
    end
  end
end
