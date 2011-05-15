Feature: Users should be able to sign up

  @wip
  Scenario: User signs up with valid info
    Given I am on the home page
      And I follow "user.create"

     When I fill in the following:
      | user[email]        | joe@example.com |
      | user[password]     | secret          |
      | user[confirmation] | secret          |

      And I press "user.create"

     Then I should see "user.create.success"
      And I should be logged in
