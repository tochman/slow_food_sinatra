Feature: As a restuarnt visitor
  In order to make my order i should be able to :
    - view dishes offering sorted by actegories
    - Add dish to my basket

  Background:

  Given the following categories exists
  | name |
  | Starter |
  | Main Course |
  | Dessert |

    Given the following dishes exists
    | name     | category    | price |
    | Salad    | Starter     | 30    |
    | Soup     | Starter     | 40    |
    | Fries    | Starter     | 35    |
    | Pasta    | Main Course | 90    |
    | Pizza    | Main Course | 85    |
    | Kebab    | Main Course | 110   |
    | Cake     | Dessert     | 50    |
    | Fruit    | Dessert     | 60    |
    | IceCream | Dessert     | 75    |

  Scenario: list menu items
    Given I am registerd as admin
    And I am on the home page
    Then I should be on the "home" page
    And I click on "Menu"
    Then I should be on the "Menu" page
    Then show me the page
    And I should see "You dont have any dishes yet"
