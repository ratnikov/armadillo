require 'spec_helper'

describe User do
  it "require matching confirmation" do
    Factory.build(:user, :password => 'secret', :confirmation => 'secret').should be_valid
    Factory.build(:user, :password => 'secret', :confirmation => 'sEcret').should have_error(:confirmation => /does not match/i)
    Factory.build(:user, :password => 'secret', :confirmation => nil).should have_error(:confirmation => /does not match/i)
  end

  it "should not allow mass-assigning sensitive fields" do
    user = User.new :salt => '1234', :encrypted_password => 'abcdef'

    user.salt.should be_blank
    user.encrypted_password.should be_blank
  end
end
