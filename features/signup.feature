Feature: Users should be able to sign up

  Scenario: User signs up with valid info
    Given I am on the home page
      And I follow "user.create_link"

     When I fill in the following:
       | user[email]        | joe@example.com |
       | user[password]     | secret          |
       | user[confirmation] | secret          |

      And I press "user.create_button"

     Then I should see "user.create.success"
      And I should be logged in

  Scenario: User already exists
    Given user "joe@example.com/somepassword" exists
      And I am on the home page
      And I follow "user.create_link"

     When I fill in the following:
       | user[email]	     | joe@example.com |
       | user[password]      | secret          |
       | user[password]      | secret          |

      And I press "user.create_button"

     Then I should see "user.create.failure"
      And I should not be logged in

  @wip
  Scenario: User sign ups with non-matching confirmation
    Given I am on the home page
      And I follow "user.create_link"

     When I fill in the following:
       | user[email]        | joe@example.com |
       | user[password]     | secret          |
       | user[confirmation] | Secret          |

      And I press "user.create_button"

     Then I should see "user.create.failure"
      And I should not be logged in
