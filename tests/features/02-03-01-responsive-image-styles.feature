Feature: Responsive image styles provided by Web Assets
  As a site administrator
  I want all Web Assets responsive image styles available
  So that media images render across breakpoints

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: All Web Assets responsive image styles are listed
    When I navigate to "/admin/config/media/responsive-image-style"
    Then I should see "Responsive image styles"
     And I should see "Origenal"
     And I should see "Square"
     And I should see "Standard"
     And I should see "Traditional"
     And I should see "Ultrawide"

  Scenario: Standard responsive image style edit form is reachable
    When I navigate to "/admin/config/media/responsive-image-style/standard"
    Then I should see "Edit responsive image style Standard"

  Scenario: Square responsive image style edit form is reachable
    When I navigate to "/admin/config/media/responsive-image-style/square"
    Then I should see "Edit responsive image style Square"
