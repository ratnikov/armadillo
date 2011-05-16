require 'spec_helper'

describe Filter do
  it "should have valications" do
    Factory.build(:filter, :query => nil).should_not be_valid
    Factory.build(:filter, :user => nil).should_not be_valid
  end
end
