Feature: Adding a Video media item
  As a content editor
  I want to access the Video media add form
  So that I can upload locally hosted video files as media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Video form is reachable
    When I navigate to "/media/add/video"
    Then I should see "Add Video"
     And I should see "Add a new file"
     And I should see the button "Save"
