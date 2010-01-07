Feature: Manage Scores
  In order to record my whisky tasting
  As a user
  I want to create and manage scores

  Scenario: View a list of my scores
    Given I have scored expressions named 10 Year Old, 12 Year Old
    When I go to the list of expressions
    Then I should see "10 Year Old"
    And I should see "12 Year Old"

