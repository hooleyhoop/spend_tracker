require 'spec_helper'

describe "groups/index.html.erb" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => ""
      ),
      stub_model(Group,
        :name => ""
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
