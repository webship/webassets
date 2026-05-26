Feature: Image styles provided by Web Assets
  As a site administrator
  I want Web Assets image styles available
  So that responsive image styles can map breakpoints to the right derivatives

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Web Assets image styles appear in the image styles list
    When I navigate to "/admin/config/media/image-styles"
    Then I should see "Image styles"
     And I should see "Origenal small"
     And I should see "Square small"
     And I should see "Standard small"
     And I should see "Traditional small"
     And I should see "Ultrawide small"
