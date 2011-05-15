Feature: Users should learn about the site

  Scenario: User should learn about our name
    When I am on the home page

    Then I should see "Armadillo"

  Scenario: Users should learn about source code
    When I am on the home page
    Then I should see a link to "http://github.com/ratnikov/armadillo"

