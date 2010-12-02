require 'spec_helper'

include Domain

describe Domain do

	it "should not be a big ball of shit" do

		Domain.new().should raise_error("Shit")

	end

end
