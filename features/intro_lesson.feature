Feature: Intro lesson

  Scenario:
    Given there is a vim intro lesson
    When  I go to the home page
    And   I follow "Start Now"
    And   I follow "I'm a beginner"
    Then  I am on the vim intro lesson page
