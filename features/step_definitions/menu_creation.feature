Feature: As a restuarnt owner
  In order to have selection of dishes in menu for visitors to order from
  i want to access protected part of the applicaiton and add information about :
  resturant
  dishes offered: in 3 be it Starter , Main Course  , Dessert
  dish price

  Scenario: list menu items
    Given I am a registered and logged in as admin
    When I click "menu" link
    Then I should see "You did not add any dish yet"

  Scenario: Add a dish
    Given I am a registered and logged in as admin
    When I click "menu" link
    And I click "Add dish" link
    And I fill in "dish title" with "Salad"
    And I select "dish category" as "Starter"
    And I fill in "dish price" with "50"
    And I click "Add" link
    Then a new "dish" should be created
    And I should be on the menu index page
    And I should see "Salad"

  Scenario: Visitors can not add dishes
    Given I am on the home page
    And I click "menu" link
    Then I should not see "Add dish"
