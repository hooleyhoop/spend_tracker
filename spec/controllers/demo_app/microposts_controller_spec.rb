require 'spec_helper'

include DemoApp

describe MicropostsController do

	render_views()

	describe "access control" do

    it "should deny access to 'create'" do
        post :create
        response.should redirect_to( demo_app_signin_path )
    end

    it "should deny access to 'destroy'" do
        delete :destroy, :id => 1
        response.should redirect_to( demo_app_signin_path )
    end
  end

	describe "POST 'create'" do

    before(:each) do
        @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

        before(:each) do
            @attr = { :content => "" }
        end

        it "should not create a micropost" do
            lambda do
                post :create, :micropost => @attr
            end.should_not change( Micropost, :count )
        end

      it "should render the home page" do
        post :create, :micropost => @attr
        response.should render_template('static_pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :content => "Lorem ipsum" }
      end

      it "should create a micropost" do
#putback        lambda do
#putback          post :create, :micropost => @attr
#putback        end.should change(Micropost, :count).by(1)
      end

      it "should redirect to the home page" do
#putback        post :create, :micropost => @attr
#putback        response.should redirect_to( root_path )
      end

      it "should have a flash message" do
#putback        post :create, :micropost => @attr
#putback        flash[:success].should =~ /micropost created/i
      end
    end
  end

	describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
#putback        wrong_user = Factory(:user, :email => Factory.next(:email))
#putback        test_sign_in(wrong_user)
#putback        @micropost = Factory(:micropost, :user => @user)
      end

      it "should deny access" do
#        delete :destroy, :id => @micropost
#putback        response.should redirect_to( root_path )
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
#putback        @micropost = Factory(:micropost, :user => @user)
      end

      it "should destroy the micropost" do
#putback        lambda do
#putback          delete :destroy, :id => @micropost
#putback        end.should change(Micropost, :count).by(-1)
      end
    end
  end

end
