Feature:


  Scenario: Register a User
    Given I am on the home page
    And I click on "Register"
    Then I should be on the "Register" page
    And I fill in "Username" with "user"
    And I fill in "Password" with "user"
    And I click on "Create account"
    Then I should be on the "home" page
    #Then show me the page
    And I should see "Successfully created account for user"
