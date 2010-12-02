class CreateHooGroupMemberships < ActiveRecord::Migration
  def self.up
    create_table :hoo_group_memberships do |t|
      t.references :hoo_group
      t.references :hoo_member
      t.string :instrument
      t.timestamps
    end
  end

  def self.down
    drop_table :hoo_group_memberships
  end
end
