# == Schema Information
# Schema version: 20101202144715
#
# Table name: group_memberships
#
#  id         :integer         not null, primary key
#  group_id   :integer
#  member_id  :integer
#  instrument :string(255)
#  created_at :datetime
#  updated_at :datetime
#
module Domain
	class HooGroupMembership < ActiveRecord::Base

		attributes_protected_by_default();

		belongs_to	:hoo_group
		belongs_to	:hoo_member
	end
end
