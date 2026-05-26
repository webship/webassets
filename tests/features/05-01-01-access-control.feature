Feature: Access control on Web Assets administration pages
  As a site administrator
  I want only authorized users to reach media admin pages
  So that unauthorized users cannot configure or list media

  Scenario: Anonymous user cannot access the media admin listing
    Given I am an anonymous user
    When I navigate to "/admin/content/media"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the media type configuration
    Given I am an anonymous user
    When I navigate to "/admin/structure/media"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the responsive image style configuration
    Given I am an anonymous user
    When I navigate to "/admin/config/media/responsive-image-style"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the image style configuration
    Given I am an anonymous user
    When I navigate to "/admin/config/media/image-styles"
    Then I should see "Access denied"
