Feature: Lesson

  Background:
    Given I am signed in as an admin
    And I am on the admin dashboard

  Scenario: Create new lesson
    Given I follow "Lessons"
    And I follow "New Lesson"
    When I fill in the lesson form
    And I click to submit the lesson form
    Then I am on the admin lessons page
    And I see that lesson

  Scenario: Edit a lesson
    Given I have a lesson
    And I follow "Lessons"
    When I click on that lesson
    When I fill in the lesson form
    And I click to update that lesson
    Then I am on the admin lessons page
    And I see that lesson
