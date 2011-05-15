require 'spec_helper'

describe SessionsController do
  describe "#new" do
    before { get :new }

    it { should render_template('new') }
  end

  describe "#create" do
    before { Factory.create :user, :email => 'joe@example.com', :password => 'secret' }

    it "should allow valid login" do

      post :create, :session => { :email => 'joe@example.com', :password => 'secret' }

      flash[:success].should_not be_nil
      should redirect_to('/')

      controller.signed_in?.should be_true
    end
      
    it "should render error for invalid password" do
      post :create, :session => { :email => 'joe@example.com', :password => 'bad-password' }

      flash[:failure].should_not be_nil
      should render_template('new')
    end

    it "should render error for unknown email" do
      post :create, :session => { :email => 'noone@example.com', :password => 'secret' }

      flash[:failure].should_not be_nil
      should render_template('new')
    end
  end

  describe "#destroy" do
    it "should reset the session on success" do
      delete :destroy, { }, :user_id => Factory.create(:user)

      controller.signed_in?.should be_false
      should redirect_to("/")

      flash[:success].should_not be_nil
    end
  end
end
