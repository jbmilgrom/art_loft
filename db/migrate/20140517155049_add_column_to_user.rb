class AddColumnToUser < ActiveRecord::Migration
  def change
  	# add_column :chefs, :email, :string
  	add_column :users, :has_venue, :boolean
  end
end
