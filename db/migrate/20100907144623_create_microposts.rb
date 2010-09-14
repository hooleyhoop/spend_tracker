class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    #add an index on the user id column as we will wont to receive all posts by id
    add_index :microposts, :user_id
  end

  def self.down
    drop_table :microposts
  end
end
