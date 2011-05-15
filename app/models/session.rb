class Session
  attr_accessor :email, :password

  def initialize(options = nil)
    unless options.nil?
      options.each do |key, value|
        send("#{key}=", value)
      end
    end
  end

  def user
    User.authenticate email, password
  end
end
