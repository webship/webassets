Feature: Adding a Remote audio media item
  As a content editor
  I want to add a Remote audio item by its oEmbed URL
  So that I can embed audio from supported oEmbed providers

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Remote audio form is reachable
    When I navigate to "/media/add/remote_audio"
    Then I should see "Add Remote audio"
     And I should see the button "Save"
