Feature: Users should be able to authenticate with the site

  Scenario: Visitor is not signed up
    Given I am on the sign in page

     When I fill in the following:
      | session[email]    | noone@example.com |
      | session[password] | secret            |

      And I press "session.create_button"
      
     Then I should see "session.create.failure"
      And I should not be logged in

  Scenario: Visitor enters wrong password
    Given user "joe@example.com/password" exists
      And I am on the sign in page

     When I fill in the following:
       | session[email]    | joe@example.com |
       | session[password] | bad-password    |

      And I press "session.create_button"
      
     Then I should see "session.create.failure"
      And I should not be logged in

  Scenario: Visitor signs in successfully
    Given user "joe@example.com/secret" exists
      And I am on the sign in page

     When I fill in the following:
       | session[email]    | joe@example.com |
       | session[password] | secret          |

      And I press "session.create_button"
     
     Then I should see "session.create.success"
      And I should be logged in

  Scenario: Visitor logs out
    Given user "joe@example.com/secret" exists
      And I am logged in as "joe@example.com/secret"

     When I follow "session.destroy_link"

     Then I should not be logged in
