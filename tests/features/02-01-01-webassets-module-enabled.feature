Feature: Web Assets module and required dependencies are enabled
  As a site administrator
  I want to verify that the Web Assets module and its dependencies are installed
  So that the asset and media management stack is ready to use

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Web Assets module is listed as enabled
    Then the "webassets" module should be installed
     And the "media" module should be installed
     And the "media_library" module should be installed
     And the "responsive_image" module should be installed
     And the "display_builder" module should be installed

  Scenario: Crop API and Focal Point modules are enabled
    Then the "crop" module should be installed
     And the "focal_point" module should be installed

  Scenario: Remote Audio media module is enabled
    Then the "media_remote_audio" module should be installed

  Scenario: Remote Image media module is enabled
    Then the "media_remote_image" module should be installed
