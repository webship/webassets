Feature: Adding a Remote video media item
  As a content editor
  I want to add a Remote video by its oEmbed URL
  So that I can embed YouTube or Vimeo videos as media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Remote video form exposes the oEmbed URL field
    When I navigate to "/media/add/remote_video"
    Then I should see "Add Remote video"
     And I should see "Video URL"
     And I should see the button "Save"
