class CreateGroupMemberships < ActiveRecord::Migration
  def self.up
    create_table :group_memberships do |t|
      t.references :group
      t.references :member
      t.string :instrument
      t.timestamps
    end
  end

  def self.down
    drop_table :group_memberships
  end
end
