Feature: Users should be able to sign up

  @wip
  Scenario: User signs up with valid info
    Given I am on the sign up page

     When I fill in the following:
      | email                 | joe@example.com |
      | password              | secret          |
      | password_confirmation | secret          |

      And I press "user.create"

     Then I should see "user.create.success"
      And I should be logged in
