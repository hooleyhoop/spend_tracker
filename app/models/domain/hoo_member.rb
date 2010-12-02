# == Schema Information
# Schema version: 20101202144715
#
# Table name: members
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base

	attributes_protected_by_default(); # Read this when ready http://b.lesseverything.com/2008/3/11/use-attr_protected-or-we-will-hack-you

	has_many :groupMemberships
	has_many :groups, :through => :groupMemberships

end
