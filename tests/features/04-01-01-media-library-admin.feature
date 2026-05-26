Feature: Media library administration
  As a site administrator
  I want to access the media admin listing
  So that I can manage media items site-wide

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can reach the media admin listing
    When I navigate to "/admin/content/media"
    Then I should see "Media"

  Scenario: Admin can reach the media library grid
    When I navigate to "/admin/content/media-grid"
    Then I should not see "Access denied"
