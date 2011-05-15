require 'spec_helper'

describe UsersController do
  describe "#new" do
    before(:each) { get :new }
    it { should render_template('new') }
  end
end
