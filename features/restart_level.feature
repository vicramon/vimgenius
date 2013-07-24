Feature: Restart level

  Background:
    Given I have a vim lesson
    And I visit the home page
    And I follow "Start Now"
    And I follow "I'm a beginner"
    When I follow "Start Level 1"
    And I type "cw"
    And I click to view the next command
    And I type "cw"
    And I click to view the next command
    And I type "cw"
    And I click to view the next command
    And I type "cw"
    And I click to view the next command

  @javascript
  Scenario:
    Given I see the lesson completed page
    When I follow "Restart Level 1"
    Then I am on the command prompt page
