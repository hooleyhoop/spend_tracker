require 'spec_helper'

describe Domain do

	it "should not be a big ball of shit" do

		Domain::Domain.new().should raise_error("Shit")

	end

end
