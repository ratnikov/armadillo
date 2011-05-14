When /^I am on the home page$/ do
  When %{I visit "/"}
end

When /^I visit "(.*)"$/ do |url|
  visit url
end

Then /^I should see a link to "(.*)"$/ do |url|
  page.should have_xpath("//a[@href='#{url}']")
end
