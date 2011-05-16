Given /^I create "(.*)" deal filter$/ do |query|
  When %{I follow "filter.list"}

  And %{I fill in "filter[query]" with "#{query}"}

  And %{I press "filter.create_button"}

  Then %{filter "#{query}" should exist}
end

Then /^filter "(.*)" should exist$/ do |query|
  Filter.exists?(:query => query).should be_true
end

Then /^filter "(.*)" should not exist$/ do |query|
  Filter.exists?(:query => query).should be_false
end
