Given /^user "(.*)\/(.*)" exists$/ do |email, password|
  User.create! :email => email, :password => password, :confirmation => password
end
