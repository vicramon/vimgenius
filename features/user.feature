Feature: Admin/user

  Scenario:
    Given I have a user
    And I am signed in as an admin
    And I am on the admin dashboard
    When I follow "Users"
    Then I am on the admin users page
    And I see that user
