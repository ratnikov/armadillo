require 'spec_helper'

describe UsersController do
  describe "#new" do
    before(:each) { get :new }
    it { assigns(:user).should_not be_nil }
    it { should render_template('new') }
  end

  describe "#create" do
    context "with valid data" do
      before { post :create, :user => { :email => 'joe@example.com', :password => 'secret', :confirmation => 'secret' } }

      it { should redirect_to('/') }
      it { flash[:success].should_not be_blank }

      it "should authenticate with the specified info" do
        User.authenticate('joe@example.com', 'secret').should_not be_nil
      end
    end

    it "should handle failure" do
      post :create, :user => { :email => nil }
      flash[:failure].should_not be_nil

      should render_template('new')
    end
  end
end
