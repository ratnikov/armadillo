Feature: Users should be able to setup to be notified when interesting deals occur

  @todo
  Scenario: User sets up email notification for a deal matching a string
    Given user "joe@example.com/secret" is registered
      And "joe@example.com/secret" sets a filter to "laptop"
      And woot is running a deal for a "Windows XP Awesome Blue Ray laptop"

     When deals are indexed

     Then "joe@example.com" should get an email about "Windows XP Awesome Blue Ray laptop"
