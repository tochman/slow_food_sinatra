Feature: As a visitor to the resturant website
  In order to make my order, i should be able to :
  - see mneu including : dish / categoru  / price
  - add dishes to my order
  - see total order price
  - see expected time to pick up

  Scenario: view the menu
    Given Iam on the main page
    When I click on "menu" link
    Then I should see list of dishes / category / price

  Scenario: Select order items
    Given Iam on the main page
    And I click on "menu" link
    When I select a "Salad"
    And i select a "Pasta"
    Then "Salad" and "Pasta" should be added to my "order"
    And "Salad" and "Pasta" pricees added to my "order value"

  Scenario: finalize order
    Given I slected order items
    And I click on "proceed" link
    And its 18:00 now
    Then I should see "Thank you for ordering: Salad and Pasta"
    And I should see "Your order total is : 120"
    And I should see "Your order will be ready for pick up at 18:30"
