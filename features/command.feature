Feature: Command

  Background:
    Given I am signed in as an admin
    And I am on the admin dashboard
    And I have a lesson
    And I have a level
    And I follow "Lessons"
    And I click on that lesson
    And I click on that level

  Scenario: Admin creates a new command
    When I follow "New Command"
    And I fill in the command form
    And I press "Create Command"
    Then I am on that command's edit page
    And I see that command

  Scenario: Admin edits a command
    Given I have a command
    And I go to edit that level
    When I click to edit that command
    And I fill in the command form
    And I press "Update Command"
    Then I am on that command's edit page
    And I see that command
