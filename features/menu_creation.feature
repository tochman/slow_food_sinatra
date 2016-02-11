Feature: As a restuarnt owner
  In order to have selection of dishes in menu for visitors to order from
  i want to access protected part of the applicaiton and add information about :
  resturant
  dishes offered: in 3 be it Starter , Main Course  , Dessert
  dish price

  Scenario: list menu items
    Given I am logged in as admin
    Then I should be on the "home" page
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I should see "You dont have any dishes yet"

  #    Then I should see "You did not add any dish yet"
  #
  Scenario: Add a dish
   Given I am logged in as admin
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I click on "Add Dish"
    And I fill in "Name" with "Salad"
    And I fill in "Category" with "Starter"
    And I fill in "Price" with "50"
    And I click on "Add"
    Then I should be on the "menu" page
    And I should see "Successfully added Salad"


    #  Scenario: Visitors can not add dishes
    #    Given I am on the home page
    #    And I click on "menu"
    #    Then I should not see "Add dish"
    #Scenario: Add a dish as non admin user
    #  Given I am a registered and logged in as visitor
    #  When I click "menu"
    #  Then I should be on the "menu" page
    #  Then I should not see "Add dish"
    #Scenario: Add a dish as non admin user via accessing the route
    #  Given I am a registered and logged in as visitor
    #  Given I visit the "add dish" page
    #  Then I should see "You are not authorived to do that"
