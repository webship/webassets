# Step definitions

Project-specific Gherkin steps for the Web Assets BDD suite. Loaded by
`cucumber.js` alongside the built-in webship-js steps in
`node_modules/webship-js/tests/step-definitions/`.

`webassets.steps.js` adds three steps:

- `Then I should see a "<Label>" field` and `Then I should see an
  "<Label>" field`: assert a labelled form field is visible. Handles
  CKEditor and file widgets that hide the underlying input.
- `Then I should see the button "<Text>"`: assert a button with the
  given text is visible.

The login by account handle (`Given I am a logged in user with the "<X>"
user`) and the access steps come from `@webship-js/drupal-core-steps`.
