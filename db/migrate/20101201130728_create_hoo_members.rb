class CreateHooMembers < ActiveRecord::Migration
  def self.up
    create_table :hoo_members do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
    # we must make sure that email is unique
    add_index :hoo_members, :email, :unique=>true
  end

  def self.down
    drop_table :hoo_members
	remove_index :hoo_members, :email
  end
end
