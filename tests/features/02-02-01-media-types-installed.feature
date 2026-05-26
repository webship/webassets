Feature: Media types provided by Web Assets
  As a content editor
  I want all expected media types available
  So that I can manage local and remote assets

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: All six media types are listed
    When I navigate to "/admin/structure/media"
    Then I should see "Media types"
     And I should see "Audio"
     And I should see "Document"
     And I should see "Image"
     And I should see "Remote audio"
     And I should see "Remote video"
     And I should see "Video"

  Scenario: Image media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/image"
    Then I should see "Edit Image"

  Scenario: Document media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/document"
    Then I should see "Edit Document"

  Scenario: Audio media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/audio"
    Then I should see "Edit Audio"

  Scenario: Video media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/video"
    Then I should see "Edit Video"

  Scenario: Remote audio media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/remote_audio"
    Then I should see "Edit Remote audio"

  Scenario: Remote video media type edit form is reachable
    When I navigate to "/admin/structure/media/manage/remote_video"
    Then I should see "Edit Remote video"
