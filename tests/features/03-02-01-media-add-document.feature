Feature: Adding a Document media item
  As a content editor
  I want to access the Document media add form
  So that I can upload documents such as PDFs

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Add Document form is reachable
    When I navigate to "/media/add/document"
    Then I should see "Add Document"
     And I should see "Add a new file"
     And I should see the button "Save"
