class CreateHooGroupMemberships < ActiveRecord::Migration
  def self.up
  # Note
    create_table :hoo_group_memberships, :id =>false do |t|
    # NB references is a helper method that adds hoo_group_id
      t.references :hoo_group
      t.references :hoo_member
      t.string :instrument
      t.timestamps
    end

    #Indexes are important for performance if join table grow large
	add_index :hoo_group_memberships, [:hoo_group_id, :hoo_member_id]	# fast lookuop by hoo_group_id
	add_index :hoo_group_memberships, :hoo_member_id					# fast lookup by hoo_member_id
  end

  def self.down
    drop_table :hoo_group_memberships
  end
end
