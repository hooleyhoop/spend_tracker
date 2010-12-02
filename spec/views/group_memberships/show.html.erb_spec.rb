require 'spec_helper'

describe "group_memberships/show.html.erb" do
  before(:each) do
    @group_membership = assign(:group_membership, stub_model(GroupMembership,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
