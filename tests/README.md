# Web Assets — tests

[webship-js](https://www.npmjs.com/package/webship-js) (Playwright + Cucumber-js)
BDD suite for the Web Assets module.

```
tests/
├── features/          # *.feature Gherkin scenarios
├── step-definitions/  # Project-specific Given / When / Then implementations
├── selectors/         # Per-theme CSS/XPath selector registries (Claro, Gin)
├── reports/           # cucumber_report.json / .html (gitignored contents)
├── screenshots/       # PNG captures on failure (gitignored contents)
└── videos/            # Playwright .webm on failure (gitignored contents)
```

Each subfolder has its own README documenting what lives there.

## Quick start

```bash
# 1. Have the DDEV site up with the module enabled
ddev start
ddev drush sql:drop -y
ddev drush site:install standard --account-name=webmaster --account-pass=dD.123123ddd -y
ddev drush en webassets -y

# 2. Install deps once
yarn install
./node_modules/.bin/playwright install --with-deps chromium

# 3. Run the suite
LAUNCH_URL="https://drupal11webassets.ddev.site:33001" yarn test
```

## Local CI dry-run (gitlab-ci-local)

The project ships a slim `.gitlab-ci-local.yml` sidecar that mirrors the
`webship-js-test` job and joins the running DDEV network:

```bash
gitlab-ci-local \
  --file .gitlab-ci-local.yml \
  --network ddev-drupal11webassets_default \
  webship-js-test
```

## CI

The canonical pipeline lives at `.gitlab-ci.yml` and runs on drupalci.
The first scenario in `features/01-01-01-users-login.feature` provisions
the per-role test users, so the CI before-script only needs to install
Drupal with the Webmaster super-admin account.
