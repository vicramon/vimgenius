Feature: Level

  Scenario: Admin creates a level
    Given I am signed in as an admin
    And I am on the admin dashboard
    And I have a lesson
    And I follow "Lessons"
    And I click on that lesson
    And I follow "New Level"
    When I fill in the level form
    And I press "Create Level"
    Then I am on that level's edit page
    And that level is in the database

  Scenario: Admin edits a level
    Given I am signed in as an admin
    And I am on the admin dashboard
    And I have a lesson
    And I have a level
    And I follow "Lessons"
    And I click on that lesson
    And I click on that level
    When I fill in the level form
    And I press "Update Level"
    Then I am on that level's edit page
    And that level is in the database

