Feature: As a restuarnt owner
  In order to have selection of dishes in menu for visitors to order from
  i want to access protected part of the applicaiton and add information about :
  resturant
  dishes offered: in 3 be it Starter , Main Course  , Dessert
  dish price

  Background:
    Given the following categories exists
    | name |
    | Starter |
    | Main Course |

  Scenario: list menu items
    Given I am registerd as admin
    And I am on the home page
    Then I should be on the "home" page
    And I click on "Menu"
    Then I should be on the "menu" page
    And I should see "You dont have any dishes yet"

  Scenario: Add a dish as admin
    Given I am registerd as admin
    And I am on the home page
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I click on "Add Dish"
    And I fill in "dish_name" with "Bread"
    And I fill in "Price" with "50"
    And I fill in "category_name" with "Starter"
    And I click on "Add"
    Then I should be on the "menu" page
    And I should see "Successfully added Bread"

  Scenario: Add a dish as visitor
    Given I am registerd as visitor
    And I am on the home page
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I click on "Add Dish"
    And I should see "Please, enjoy ordering and leave dish creation to our Chef!"
