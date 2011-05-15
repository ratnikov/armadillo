Then /^I should be logged in$/ do
  Then %{I should see "session.destroy_link" link}
end

Then /^I should not be logged in$/ do
  Then %{I should see "session.create_link" link}
end
