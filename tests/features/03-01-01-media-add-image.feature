Feature: Adding an Image media item
  As a content editor
  I want to access the Image media add form
  So that I can upload images as reusable media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Image form is reachable and shows the expected file widget
    When I navigate to "/media/add/image"
    Then I should see "Add Image"
     And I should see "Add a new file"
     And I should see "Allowed types: png gif jpg jpeg."
     And I should see the button "Save"

  Scenario: Add media chooser lists every Web Assets media type
    When I navigate to "/media/add"
    Then I should see "Add media item"
     And I should see "Image"
     And I should see "Document"
     And I should see "Audio"
     And I should see "Video"
     And I should see "Remote audio"
     And I should see "Remote video"
