Feature: Users should be able to authenticate with the site

  @todo
  Scenario: Visitor is not signed up
    Given no user exists with an email of "joe@example.com"
     When I go to sign in page
      And I sign in as "joe@example.com/password"
      
     Then I should see "Bad email or password"
      And I should be signed out

  @todo
  Scenario: Visitor enters wrong password
    Given I am signed up as "joe@example.com/password"
     When I go to sign in page
      And I fill in the following:
       | email    | joe@example.com |
       | password | bad-password   |
      
     Then I should see "session.create.failure"
      And I should be signed out

  Scenario: Visitor signs in successfully
    Given user "joe@example.com/secret" exists
      And I am on the sign in page

     When I fill in the following:
       | session[email]    | joe@example.com |
       | session[password] | secret          |

      And I press "session.create_button"
     
     Then I should see "session.create.success"
      And I should be logged in
