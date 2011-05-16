require 'spec_helper'

describe FiltersController do
  before(:each) { @user = Factory.create :user }

  it { should require_login_for(:index) }

  describe '#index' do
    before :each do
      Factory.create :filter, :query => 'Foo', :user => @user
      Factory.create :filter, :query => 'Bar'

      controller.current_user = @user
      get :index, {}
    end

    it "should return only filters for the user" do
      assigns(:filters).should == @user.filters
    end

    it { should render_template('index') }
  end
end
