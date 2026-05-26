Feature: Adding an Audio media item
  As a content editor
  I want to access the Audio media add form
  So that I can upload audio files as reusable media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Audio form is reachable
    When I navigate to "/media/add/audio"
    Then I should see "Add Audio"
     And I should see "Add a new file"
     And I should see the button "Save"
