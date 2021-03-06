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
module Infrastructure
	class HooMember < ActiveRecord::Base

		attributes_protected_by_default();
		# Read this when ready http://b.lesseverything.com/2008/3/11/use-attr_protected-or-we-will-hack-you

		has_many :hoo_group_memberships
		has_many :hoo_groups, :through => :hoo_group_memberships	# dependant destroy?

		#TODO: move this to a valid email checker object
		email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  		validates :name, :presence =>true, :length=>{ :minimum=>3, :maximum=>50 }
		validates :email, :presence =>true, :format=>{ :with=>email_regex }, :uniqueness=>{ :case_sensitive=>false } #ignore case when matching uniqueness

		#NB This uniquess test on email can fail if two requests come in quick succession. We must also enforce uniqueness at the database level.
		# Our method is to create a database index on the email column, and then require that the index be unique.

		def self.[](email)
			self.find_by_email(email)
		end
  
		# No Initialize on ActiveRecord subclass!
		after_initialize :init

		def init
			@my_cache = {}
		end
  
		# Learn about transactions http://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html
		def botchedSaveUniqueProperties

			self.save! # save is automatically in a transaction
			return self.valid?

			rescue ActiveRecord::StatementInvalid
				puts 'chicks'
				return false

			rescue ActiveRecord::RecordInvalid
				puts 'flicks'
				return false
		end
		
		def email
			self[:email]
		end

		def email=email
			self[:email] = email.downcase
		end


	end
end
