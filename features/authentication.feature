Feature: Users should be able to authenticate with the site

  @todo
  Scenario: Visitor is not signed up
    Given no user exists with an email of "joe@exaple.com"
     When I go to sign in page
      And I sign in as "joe@exaple.com/password"
      
     Then I should see "Bad email or password"
      And I should be signed out

  @todo
  Scenario: Visitor enters wrong password
    Given I am signed up as "joe@exaple.com/password"
     When I go to sign in page
      And I fill in the following:
       | email    | joe@exaple.com |
       | password | bad-password   |
      
     Then I should see "session.create.failure"
      And I should be signed out

  @wip
  Scenario: Visitor signs in successfully
    Given user "joe@exaple.com/secret" exists
      And I am on the sign in page

     When I fill in the following:
       | session[email]    | joe@exaple.com |
       | session[password] | password       |

      And I press "session.create_button"
     
     Then I should see "session.create.success"
      And I should be signed in
      
     When I return next time
     Then I should be signed in
