Given /^I am logged in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am on the home page}

  When %{I follow "session.create_link"}

  And %{I fill in "session[email]" with "#{email}"}
  And %{I fill in "session[password]" with "#{password}"}

  And %{I press "session.create_button"}

  Then %{I should be logged in}
end

Then /^I should be logged in$/ do
  Then %{I should see "session.destroy_link" link}
end

Then /^I should not be logged in$/ do
  Then %{I should see "session.create_link" link}
end
