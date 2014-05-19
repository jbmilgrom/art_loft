class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
  	#remove_column :table_name, :column_name
  	remove_column :users, :bio
  	#add_column :users, :has_venue, :boolean
  	add_column :users, :bio, :text

  end
end
