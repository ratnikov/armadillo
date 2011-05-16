Feature: Users should be able to create filters to watch for a deal

  @wip
  Scenario: A user creates a deal filter
    Given user "joe@example.com/secret" exists
      And I am logged in as "joe@example.com/secret"

     When I follow "filter.list"
      And I fill in the following:
	| filter[query] | laptops |

      And I press "filter.create_button"

     Then I should see "filter.create.success"
    
     When I follow "filter.list"
     Then I should see "laptops"
