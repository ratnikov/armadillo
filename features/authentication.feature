Feature: Users should be able to authenticate with the site

  @todo
  Scenario: Visitor is not signed up
    Given no user exists with an email of "email@person.com"
     When I go to the sign in page
      And I sign in as "email@person.com/password"
      
     Then I should see "Bad email or password"
      And I should be signed out

  @todo
  Scenario: Visitor enters wrong password
    Given I am signed up as "email@person.com/password"
     When I go to the sign in page
      And I fill in the following:
       | email    | email@person.com |
       | password | bad-password     |
      
     Then I should see "session.create.failure"
      And I should be signed out

  @todo
  Scenario: Visitor signs in successfully
    Given user "email@person.com/secret" exists
    
     When I go to the sign in page

      And I fill in the following:
       | email    | email@person.com |
       | password | password         |
     
     Then I should see "session.create.success"
      And I should be signed in
      
     When I return next time
     Then I should be signed in
