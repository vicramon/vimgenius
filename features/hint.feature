Feature: User can get a hint by pressing the right arrow key

  @javascript
  Scenario:
    Given there is a vim intro lesson
    And  I go to the vim intro lesson page
    And  I follow "Start Level 1"
    When I press the right arrow key
    Then I should see the first hint
    When I press the right arrow key
    Then I should see the second hint
