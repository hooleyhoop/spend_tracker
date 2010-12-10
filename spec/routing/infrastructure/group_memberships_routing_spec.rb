require "spec_helper"

describe GroupMembershipsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/group_memberships" }.should route_to(:controller => "group_memberships", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/group_memberships/new" }.should route_to(:controller => "group_memberships", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/group_memberships/1" }.should route_to(:controller => "group_memberships", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/group_memberships/1/edit" }.should route_to(:controller => "group_memberships", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/group_memberships" }.should route_to(:controller => "group_memberships", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/group_memberships/1" }.should route_to(:controller => "group_memberships", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/group_memberships/1" }.should route_to(:controller => "group_memberships", :action => "destroy", :id => "1")
    end

  end
end
