Feature: Lesson flow

  @javascript
  Scenario: A user types the correct command, sees the next button
    Given I have a vim intro lesson
    And I visit the home page
    And I follow "Start Now"
    And I follow "I'm a beginner"
    When I follow "Start Level 1"
    And I type "cw"
    And I click to view the next command
