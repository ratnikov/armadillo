require 'spec_helper'

describe User do
  it "require matching confirmation" do
    Factory.build(:user, :password => 'secret', :confirmation => 'secret').should be_valid
    Factory.build(:user, :password => 'secret', :confirmation => 'sEcret').should have_error(:confirmation => /does not match/i)
    Factory.build(:user, :password => 'secret', :confirmation => nil).should have_error(:confirmation => /does not match/i)
  end
end
