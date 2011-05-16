class Filter < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :query, :user
end
