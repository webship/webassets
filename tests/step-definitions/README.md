# Step Definitions

Project-specific Gherkin step definitions for the Web Assets BDD suite.
Loaded by `cucumber.js` alongside the built-in webship-js steps in
`node_modules/webship-js/tests/step-definitions/`.

| File | Steps |
|------|-------|
| `webassets.steps.js` | `Given I am a logged in user with the "<X>" user` — log in as a named user from `worldParameters.users`. <br> `Given I add testing users` — provision every non-admin user via `/admin/people/create`. Idempotent. <br> `Then I should see a "<Label>" field` / `Then I should see an "<Label>" field` — assert a labelled form field is visible (works around CKEditor / file widgets that hide the underlying input). <br> `Then I should see the button "<Text>"` — assert a button with the given text is visible. |
