require 'spec_helper'

describe "group_memberships/edit.html.erb" do
  before(:each) do
    @group_membership = assign(:group_membership, stub_model(GroupMembership,
      :name => "MyString"
    ))
  end

  it "renders the edit group_membership form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => group_membership_path(@group_membership), :method => "post" do
      assert_select "input#group_membership_name", :name => "group_membership[name]"
    end
  end
end
