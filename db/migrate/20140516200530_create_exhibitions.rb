class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.integer :piece_id
      t.integer :event_id

      t.timestamps
    end
  end
end
