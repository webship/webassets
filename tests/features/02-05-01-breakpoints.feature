Feature: Web Assets breakpoints
  As a site administrator
  I want Web Assets breakpoints registered with the system
  So that responsive image styles can use them

  Scenario: Breakpoints are exposed to responsive image style add form
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/config/media/responsive-image-style/add"
    Then I should see "Add responsive image style"
     And I should see "Breakpoint group"
