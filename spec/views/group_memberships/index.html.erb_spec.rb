require 'spec_helper'

describe "group_memberships/index.html.erb" do
  before(:each) do
    assign(:group_memberships, [
      stub_model(GroupMembership,
        :name => "Name"
      ),
      stub_model(GroupMembership,
        :name => "Name"
      )
    ])
  end

  it "renders a list of group_memberships" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
