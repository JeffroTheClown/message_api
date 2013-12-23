class AddInitialSchema < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.timestamps
  	end

    create_table :messages do |t|
      t.text :content
      t.integer :conversation_id
      t.integer :user_id
      t.boolean :read
      t.timestamp :read_date
      t.timestamps
    end

    create_table :conversations do |t|
      t.string :name
      t.timestamps
    end

    create_table :images do |t|
      t.string :location_path
      t.string :url_path
      t.integer :imageable_id
      t.string :imageable_type
      t.timestamps
    end

    create_table :conversations_users do |t|
      t.integer :user_id
      t.integer :conversation_id
    end
  end
end
