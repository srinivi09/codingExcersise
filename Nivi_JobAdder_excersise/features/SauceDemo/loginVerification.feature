Feature: Verify login functionality in sauce demo website

  Background:
    Given I am on sauce demo home page

  @login
  Scenario Outline: Verify user will get an error message while trying to login with invalid credential

    And I enter <username> and <password>
    When I click on login button
    Then I Should get an <loginStatus>

    Examples:
      |username        |password     |loginStatus|
      |invalid          |invalid      |errormessage|
      |standard_user    |secret_sauce |Successful|

  @addtocart
  Scenario Outline: Verify user is able to add items to cart.

    And I enter <username> and <password>
    When I click on login button
    Then I Should get an <loginStatus>
    When I click on <product> from available product list
    Then I should be able to view the <product> in the cart

    Examples:
      |username        |password     |loginStatus|  product|
      |standard_user    |secret_sauce |Successful| Sauce Labs Bolt T-Shirt|
      |standard_user    |secret_sauce |Successful| invalid|