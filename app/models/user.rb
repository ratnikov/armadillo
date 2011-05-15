class User < ActiveRecord::Base
  include Clearance::User

  attr_accessor :confirmation

  validate :confirmation_match

  private

  def confirmation_match
    unless !password.blank? && password == confirmation
      errors[:confirmation] << I18n.translate('user.errors.no_confirmation_match')
    end
  end
end
