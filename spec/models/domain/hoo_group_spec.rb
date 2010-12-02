require 'spec_helper'

describe Group do

	it "should not be a big ball of shit" do

		hooleyFamily = Group.new( 'Hooleys' )
		member1 = mock(Member)

		hooleyFamily.addMember( member1 )
	end

end
