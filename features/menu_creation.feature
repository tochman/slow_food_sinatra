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
    Then I should be on the "home" page
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I should see "You dont have any dishes yet"

  Scenario: Add a dish as admin
    Given I am registerd as admin
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I click on "Add Dish"
    #Then show me the page
    And I fill in "dish_name" with "Salad"
    And I fill in "Price" with "50"
    And I fill in "category_name" with "Starter"
    And I click on "Add"
    Then I should be on the "menu" page
    And I should see "Successfully added Salad"

  Scenario: Add a dish as visitor
    Given I am registerd as visitor
    And I click on "Menu"
    Then I should be on the "Menu" page
    And I click on "Add Dish"
    And I fill in "dish_name" with "Salad"
    And I fill in "category_name" with "Starter"
    And I fill in "Price" with "50"
    And I click on "Add"
    Then I should be on the "menu" page
    And I should see "Sorry!, you are not authorized to add dishes"
    #Then show me the page
