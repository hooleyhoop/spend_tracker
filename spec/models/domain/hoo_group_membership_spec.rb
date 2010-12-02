require 'spec_helper'

include Domain

describe HooGroupMembership do

	it "should not be a big ball of shit" do

		fred.resellers.size #=>2
		grMem = HooGroupMembership.create( :farmer=>fred, :reseller=?sallysstore )
		fred.resellers.size #=>3

	end

end
