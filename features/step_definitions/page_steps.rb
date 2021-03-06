When /^I visit "(.*)"$/ do |url|
  visit url
end

Then /^I should see a link to "(.*)"$/ do |url|
  page.should have_xpath("//a[@href='#{url}']")
end

Then /^I should see "(.*)" link$/ do |name|
  page.should have_xpath("//a[text()='#{try_translate(name)}']")
end
