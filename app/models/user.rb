class User < ActiveRecord::Base
  include Clearance::User

  attr_accessor :confirmation
end
