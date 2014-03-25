class AddInitialSchema < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.timestamps
  	end

    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.integer :receiving_user_id
      t.integer :sending_user_id
      t.timestamps
    end
  end
end
