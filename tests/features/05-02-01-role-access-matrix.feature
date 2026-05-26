Feature: Web Assets access matrix across Standard profile roles
  As a site administrator
  I want to verify media management access for every default role
  So that I know who can and cannot administer media on the Standard profile

  Scenario: Webmaster can reach the media admin listing
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/content/media"
    Then I should see "Media"

  Scenario: Webmaster can reach the media types page
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/structure/media"
    Then I should see "Media types"

  Scenario: Webmaster can reach the responsive image styles page
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/config/media/responsive-image-style"
    Then I should see "Responsive image styles"

  Scenario: Content editor cannot reach the media types page by default
    Given I am a logged in user with the "Content editor" user
    When I navigate to "/admin/structure/media"
    Then I should see "Access denied"

  Scenario: Content editor cannot reach the responsive image styles page by default
    Given I am a logged in user with the "Content editor" user
    When I navigate to "/admin/config/media/responsive-image-style"
    Then I should see "Access denied"

  Scenario: Authenticated user cannot reach the media types page
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/admin/structure/media"
    Then I should see "Access denied"

  Scenario: Authenticated user cannot reach the media admin listing
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/admin/content/media"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot reach the media admin listing
    Given I am an anonymous user
    When I navigate to "/admin/content/media"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot reach the media add chooser
    Given I am an anonymous user
    When I navigate to "/media/add"
    Then I should see "Access denied"
