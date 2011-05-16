require 'spec_helper'

describe FiltersController do
  before(:each) { controller.current_user = @user = Factory.create(:user) }

  it { should require_login_for(:index, :create) }

  describe '#index' do
    before :each do
      Factory.create :filter, :query => 'Foo', :user => @user
      Factory.create :filter, :query => 'Bar'

      get :index, {}
    end

    it "should return only filters for the user" do
      assigns(:filters).should == @user.filters
    end

    it { should render_template('index') }
  end

  describe "#new" do
    before { get :new }

    it { assigns(:filter).should be_instance_of(Filter) }
    it { should render_template('new') }
  end

  describe '#create' do
    context "with valid data" do
      before { post :create, :filter => { :query => 'laptops' } }

      it "should assign the filter to current user" do
        @user.filters.exists?(:query => 'laptops').should be_true
      end

      it { flash[:success].should_not be_nil }
      it { should redirect_to(filters_path) }
    end

    it "should render index template on error" do
      post :create, :filter => { }

      should render_template('new')
    end
  end

  describe "#destroy" do
    before do
      @filter = Factory.create :filter, :user => @user

      delete :destroy, :id => @filter.to_param
    end

    it { Filter.exists?(@filter).should be_false }
    it { should redirect_to(filters_path) }
  end
end
