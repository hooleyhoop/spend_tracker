require 'spec_helper'

describe "group_memberships/new.html.erb" do
  before(:each) do
    assign(:group_membership, stub_model(GroupMembership,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new group_membership form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => group_memberships_path, :method => "post" do
      assert_select "input#group_membership_name", :name => "group_membership[name]"
    end
  end
end
