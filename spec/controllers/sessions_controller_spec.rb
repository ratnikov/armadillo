require 'spec_helper'

describe SessionsController do
  describe "#new" do
    before { get :new }

    it { should render_template('new') }
  end
end
