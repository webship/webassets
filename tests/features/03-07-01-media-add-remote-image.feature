Feature: Adding a Remote image media item
  As a content editor
  I want to add a Remote image by its oEmbed URL
  So that I can embed Flickr, GIPHY or Getty Images as media
  (Remote image is provided by drupal/media_remote_image and uses the
  oembed:image source plugin — parallel to oembed:audio and oembed:video.)

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Remote image form is reachable
    When I navigate to "/media/add/remote_image"
    Then I should see "Add Remote image"
     And I should see the button "Save"

  Scenario: Remote image media type appears in the media types list
    When I navigate to "/admin/structure/media"
    Then I should see "Remote image"

  Scenario: Remote image media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/remote_image"
    Then I should see "Edit Remote image"
