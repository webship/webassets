# Step definitions

Project-specific Gherkin steps for the Web Assets BDD suite. Loaded by
`cucumber.js` alongside the built-in webship-js steps in
`node_modules/webship-js/tests/step-definitions/`.

`webassets.steps.js` adds four steps:

- `Given I am a logged in user with the "<X>" user`: log in as a named
  user from `worldParameters.users`.
- `Given I add testing users`: provision every non-admin user via
  `/admin/people/create`. Idempotent.
- `Then I should see a "<Label>" field` and `Then I should see an
  "<Label>" field`: assert a labelled form field is visible. Handles
  CKEditor and file widgets that hide the underlying input.
- `Then I should see the button "<Text>"`: assert a button with the
  given text is visible.
