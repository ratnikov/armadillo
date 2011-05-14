Feature: Visitors should learn general information about our site

  Scenario: Users should learn about source code
    When I am on the home page
    Then I should see a link to "http://github.com/ratnikov/armadillo"
