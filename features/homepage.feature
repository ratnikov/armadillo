Feature: Users should learn about the site

  Scenario: User should learn about our name
    When I visit "/"

    Then I should see "Armadillo"
