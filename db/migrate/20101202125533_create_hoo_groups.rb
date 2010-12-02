class CreateHooGroups < ActiveRecord::Migration
  def self.up
    create_table :hoo_groups do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :hoo_groups
  end
end
