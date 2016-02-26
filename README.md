### SlowFood (Sinatra)

Our client is a Restaurant owner that needs an website where he can list his menu and allow visitors to place orders.

#### Scope (v1)

The first version of the application has limited functionality

* The owner need to access a protected part of the application to set up information about his Restaurant and his Menu
* Menu needs to consist of many Dishes
* Each Dish is a Starter, Main course or Dessert
* Visitors of the site can add Dishes to an Order
* Order need to calculate a Total price and a Pick up time (30 minutes)

Nothing else should be considered or implemented.

#### Tools
* Sinatra as web framework
* Foundation6 as CSS framework
* PostgreSQL for database
* Warden for user authentication
* Cucumber for acceptance tests
* RSpec for unit tests

### User Stories
```
# As a Guest
In order to order a dish,
I should have a login credential to access the menu of the dishes.
```

```
# As a User
In order to get a good order,
I would like to see a list of dishes currently available in the menu
with informations about the prices and the types.
```

```
# As a User
In order to place an order,
I would like to be able to add dishes to the order list of dishes currently available in the menu
with information about the time it takes to deliver my order.
```

```
# As a Restaurant
In order to have good menu to offer to the users,
I would like to be able to have a collection of dishes in a menu.
```

```
# As a Restaurant
In order to have orders, I would like to be able to allow users to check out the menu that
contains the dishes and give  them information when is there request will be proceeded.

```

```
# As an Admin
 I would like to be able to update the information about the restaurant.
```

```
# As an Admin
 I would like to be able to add new dishes and
 also update the menu with the  new dish.
```

```
# As an Admin
 I would like to be able to remove dishes from the menu and update it.
```
