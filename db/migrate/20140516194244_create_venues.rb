class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :user_id
      t.string :address
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
