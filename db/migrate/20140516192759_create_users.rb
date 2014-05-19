class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :email
      t.string :hashed_password
      t.boolean :is_artist
      t.string :discipline
      t.string :sub_discipline
      t.text :abstract
      t.string :bio

      t.timestamps
    end
  end
end
