class RemoveColumnfromVenue < ActiveRecord::Migration
  def change

  	remove_column :venues, :capacity
  end
end
