class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  before_filter :authorize

  private

  def sign_in_url
    login_url
  end
end
