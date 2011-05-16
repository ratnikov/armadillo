Feature: Users should be able to create filters to watch for a deal

  Background:
    Given user "joe@example.com/secret" exists
      And I am logged in as "joe@example.com/secret"

  Scenario: A user creates a deal filter
     When I follow "filter.list"
      And I fill in the following:
	| filter[query] | laptops |

      And I press "filter.create_button"

     Then I should see "filter.create.success"
    
     When I follow "filter.list"
     Then I should see "laptops"

  Scenario: A user fails to create a deal filter
    When I follow "filter.list"

    # And I forget to fill things out

     And I press "filter.create_button"

    Then I should see "filter.create.failure"
     And I should see "errors.messages.blank"

  Scenario: A user removes a deal filter
   Given I create "laptops" deal filter

    When I follow "filter.list"
     And I press "filter.destroy_button" within "laptops" filter

     Then I should see "filter.destroy.success"
      And filter "laptops" should not exist
