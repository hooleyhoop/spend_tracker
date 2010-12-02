require 'spec_helper'

describe "groups/show.html.erb" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
