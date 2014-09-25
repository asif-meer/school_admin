Feature: Home Page Links
  In order to have a good landing page experience
  As a visitor
  I should see the right set of links

    Background:
      Given I am not logged in

    Scenario: User sees sign up, sign in links on home page
      When I visit the home page
      Then I should see a sign in link
      And I should see sign up links