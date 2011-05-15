require 'spec_helper'

describe UsersController do
  describe "#new" do
    before(:each) { get :new }
    it { assigns(:user).should_not be_nil }
    it { should render_template('new') }
  end
end
