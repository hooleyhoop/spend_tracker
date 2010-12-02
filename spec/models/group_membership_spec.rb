require 'spec_helper'

describe GroupMembership do

	it "should not be a big ball of shit" do

		fred.resellers.size #=>2
		grMem = GroupMembership.create( :farmer=>fred, :reseller=?sallysstore )
		fred.resellers.size #=>3

	end

end
