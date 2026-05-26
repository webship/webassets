Feature: Web Assets module and required dependencies are enabled
  As a site administrator
  I want to verify that the Web Assets module and its dependencies are installed
  So that the asset and media management stack is ready to use

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Web Assets module is listed as enabled
    When I navigate to "/admin/modules"
    Then I should see "Web Assets"
     And I should see "Media"
     And I should see "Media Library"
     And I should see "Responsive Image"
     And I should see "Layout Builder"

  Scenario: Crop API and Focal Point modules are enabled
    When I navigate to "/admin/modules"
    Then I should see "Crop API"
     And I should see "Focal Point"

  Scenario: Remote Audio media module is enabled
    When I navigate to "/admin/modules"
    Then I should see "Remote Audio"
