class CreatePiece < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
    	t.integer :user_id
		t.string  :url
    end
  end
end
