# == Schema Information
# Schema version: 20101202125533
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base

	attributes_protected_by_default();

	has_many :groupMemberships
	has_many :members, :through => :groupMemberships

protected

	def validate
		errors.add(":Account_Name", "You must supply an account name")
	end

	def validate_on_create
	end

	def validate_on_update
	end

private

	# after_find, after_initialize, before_save, after_save, before_create, after_create, before_update, after_update,
	# before_validation, after_validation, before_validation_on_create, after_validation_on_create, before_validation_on_update, after_validation_on_update,
	# before_destroy, after_destroy
end
