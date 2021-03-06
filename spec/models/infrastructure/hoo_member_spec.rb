require 'spec_helper'

include Infrastructure

describe HooMember do

	it "should not be valid with a short name" do
		aMember = HooMember.new( :name=>'a', :email=>'steve@work.com' )
		aMember.should_not be_valid

		aMember = HooMember.new( :name=>'ace', :email=>'steve@work.com' )
		aMember.should be_valid
	end

	# nb be_valid works because HooMember has valid? method. Rspec lets you test any method that returns a bool like this
	it "should not be valid with a long name" do
		aMember = HooMember.new( :name=>'aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa', :email=>'steve@work.com' )
		aMember.should_not be_valid
	end

	it "should not be valid without a name" do
		aMember = HooMember.new()
		aMember.should_not be_valid
	end

	it "should accept valid email addresses" do
		addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
		addresses.each do |address|
			valid_email_user = HooMember.new( :name=>'ace', :email=>address )
			valid_email_user.should be_valid
			result = valid_email_user.botchedSaveUniqueProperties();
			result.should == true;
		end
	end

	it "should reject invalid email addresses" do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do |address|
			invalid_email_user = HooMember.new( :name=>'ace', :email=>address )
			invalid_email_user.should_not be_valid		
		end
	end

	it "should reject duplicate email addresses" do
	# Put a user with given email address into the database.
	    attr = { :name=>'Example User', :email=>'user@example.com' }
		HooMember.create!( attr );
		
		# NB. You dont know if it has worked until you have saved
		user_with_duplicate_email = HooMember.new( attr )
		user_with_duplicate_email.should_not be_valid;
		result = user_with_duplicate_email.botchedSaveUniqueProperties()
		result.should == false;
	end

	it "should reject email addresses identical up to case" do
	    attr = { :name=>"Example User", :email=>"user@example.com" }
		upcased_email = attr[:email].upcase
		HooMember.create!( attr.merge(:email=>upcased_email) )
		user_with_duplicate_email = HooMember.new( attr )
		#user_with_duplicate_email.should_not be_valid
		result = user_with_duplicate_email.botchedSaveUniqueProperties()
		result.should == false;
	end

	# http://blog.mhartl.com/2008/06/26/working-around-the-validates_uniqueness_of-bug-in-ruby-on-rails/
	it "should prevent duplicate emails" do
		attr = { :name=>"Example User", :email=>"user@example.com" }
		person = HooMember.new( attr )
		person.save
		duplicate = HooMember.new( attr )

		lambda do
			# Pass 'false' to 'save' in order to skip the validations.
			duplicate.save( :validate=>false )
		end.should raise_error(ActiveRecord::StatementInvalid)
	end

	it "should find using email" do
	    attr = { :name=>"Example User", :email=>"user@example.com" }
		HooMember.create!( attr );
		foundMember = HooMember['user@example.com']
		foundMember.should_not be_nil
	end
	
	it 'should use custom accessors' do
		aMember = HooMember.new()
		aMember.name = 'steve'
	end
	

	it "should not be a big ball of shit" do

		aMember = HooMember.create!( :name=>'Steven', :email=>'steve@work.com' )
		#puts aMember.methods

		group = HooGroup.create!( :name=>'the Hooleys' )
		group.hoo_members << aMember

		aMember.hoo_groups.create( :name=>'the Smithsoniansons' )


		#puts aMember.hoo_groups.inspect
		#puts HooGroup.all.inspect # group.hoo_members.inspect

	#	puts HooGroup.find_by_name( 'the Smithsoniansons').inspect

	#	member1 = mock(Member)

	#	hooleyFamily.addMember( member1 )
	end

end

# HERE!
# http://railstutorial.org/chapters/modeling-and-viewing-users-one#top