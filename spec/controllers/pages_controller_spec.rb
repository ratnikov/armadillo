require 'spec_helper'

describe PagesController do
  it "should allow rendering of home page" do
    get :show, :id => 'home'

    should render_template('home')
  end

  it "should not render erroneous pages" do
    assert_raises ActionController::RoutingError do
      get :show, :id => 'unknown'
    end
  end
end
