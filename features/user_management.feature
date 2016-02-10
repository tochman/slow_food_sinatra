Feature: As visitor or Admin,
  - As admin:
  - should create admin account by providing only username & password
  - As visitor:
  - should require to have username, password and adress

  #  Scenario: Register a User : admin
  #    Given I am on the home page
  #    And I click on "Register"
  #    Then I should be on the "Register" page
  #    And I fill in "Username" with "admin"
  #    And I fill in "Password" with "admin"
  #    And I click on "Create account"
  #    Then I should be on the "home" page
  #    #Then show me the page
  #    And I should see "Successfully created account for admin"
  
  Scenario: Register a User : visitor
    Given I am on the home page
    And I click on "Register"
    Then I should be on the "Register" page
    And I fill in "Username" with "user"
    And I fill in "Password" with "user"
    And I fill in "Password Confirmation" with "user"
    And I fill in "Email" with "visitor@me.com"
    And I fill in "Phone Number" with "0988002626"
    And I click on "Create account"
    Then I should be on the "home" page
    #Then show me the page
    And I should see "Successfully created account for user"

  Scenario: Register a User : visitor with password not matching
    Given I am on the home page
    And I click on "Register"
    Then I should be on the "Register" page
    And I fill in "Username" with "user"
    And I fill in "Password" with "user"
    And I fill in "Password Confirmation" with "user_2"
    And I fill in "Email" with "visitor@me.com"
    And I fill in "Phone Number" with "0988002626"
    And I click on "Create account"
    Then I should be on the "home" page
    And I should see "Password not matching confirmation"

  Scenario: Register a User : visitor without email
    Given I am on the home page
    And I click on "Register"
    Then I should be on the "Register" page
    And I fill in "Username" with "user"
    And I fill in "Password" with "user"
    And I fill in "Password Confirmation" with "user"
    And I fill in "Email" with ""
    And I fill in "Phone Number" with "0988002626"
    And I click on "Create account"
    Then I should be on the "home" page
    #Then show me the page
    And I should see "Please add email adress"

  Scenario: Register a User : visitor without phone number
    Given I am on the home page
    And I click on "Register"
    Then I should be on the "Register" page
    And I fill in "Username" with "user"
    And I fill in "Password" with "user"
    And I fill in "Password Confirmation" with "user"
    And I fill in "Email" with "visitor@me.com"
    And I fill in "Phone Number" with ""
    And I click on "Create account"
    Then I should be on the "home" page
    #Then show me the page
    And I should see "Please provide phone number"
