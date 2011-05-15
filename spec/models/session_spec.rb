require 'spec_helper'

describe Session do
  describe "#user" do
    it "should return use with matching email/password" do
      user = Factory.create :user

      Session.new(:email => user.email, :password => user.password).user.should == user
    end

    it "should return nil for non-authenticated users" do
      Session.new(:email => 'noone@example.com', :password => 'secret').user.should be_nil
    end
  end
end
