Feature: Lesson flow

  #needs to be re-written to handle new shuffled command list
  @wip
  @javascript
  Scenario:
    Given I have a vim intro lesson
    And I visit the home page
    And I follow "Start Now"
    And I follow "I'm a beginner"
    When I follow "Start Level 1"
    And I see "Level 1" on the page
    And I type "cw"
    And I click to view the next command
    And I see "Level 1" on the page
    And I type "cw"
    And I click to view the next command
    Then I see "Recap" on the page
