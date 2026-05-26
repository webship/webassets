# Web Assets

A ready to use media library for Drupal. Install the module and a fresh site
gets seven media types (Image, Document, Audio, Video, Remote audio, Remote
image, Remote video) with sensible image styles, responsive image styles and
breakpoints already wired up. No manual setup in the admin UI.

Part of the [Webship](https://webship.co) toolkit. Sibling modules: Webpage,
Webblog, Webseo.

## Install

```bash
composer require drupal/webassets
drush en webassets -y
```

Enabling the module runs the default recipe, which turns on the media stack
(Media, Media Library, Responsive Image, Layout Builder, Crop, Focal Point,
Remote Audio, Remote Image) and imports all the configuration the seven
media types need.

## What you get

* **Seven media types**: Image, Document, Audio, Video, Remote audio,
  Remote image, Remote video.
* **Responsive image styles**: `origenal`, `square`, `standard`,
  `traditional`, `ultrawide`. Each maps onto the eight Web Assets
  breakpoints.
* **Image style derivatives** at every aspect ratio (tiny, small, medium,
  large, xlarg, xxlarg, xxxlarg) so themes pick the right crop per
  breakpoint without defining their own.
* **Crop and Focal Point** for art-directed image crops.
* **Remote audio and remote image** through the same oEmbed pipeline core
  already uses for Remote video, so all three remote bundles behave the
  same in the admin UI.
* **Layout Builder** enabled on the Image bundle's `standard` view mode.

## Breakpoints

`webassets.breakpoints.yml` registers eight breakpoints under the
`webassets` group. Themes can declare a `breakpoints` group named
`webassets` to reuse them in their own responsive image styles.

| Key | Media query |
|-----|-------------|
| `webassets.sm` | `(min-width: 500px)` |
| `webassets.md` | `(min-width: 700px)` |
| `webassets.lg` | `(min-width: 1000px)` |
| `webassets.xl` | `(min-width: 1300px)` |
| `webassets.nav-md` | `(min-width: 500px)` |
| `webassets.nav` | `(min-width: 1200px)` |
| `webassets.grid-md` | `(min-width: 700px)` |
| `webassets.grid-max` | `(min-width: 1440px)` |

## Recipes

Web Assets ships two Drupal recipes under `recipes/`:

* `recipes/default` is the one `webassets_install()` applies. It chains
  the foundation recipe and then layers Layout Builder displays for the
  Image bundle on top.
* `recipes/foundation` does the heavy lifting: enables every dependency
  module and creates the media types, fields, view modes, image styles
  and responsive image styles.

Either recipe can be applied standalone on a fresh Drupal 11.3+ site:

```bash
php core/scripts/drupal recipe modules/contrib/webassets/recipes/default
```

## Testing

A [webship-js](https://www.npmjs.com/package/webship-js) (Playwright +
Cucumber-js) BDD suite lives under `tests/`. See `tests/README.md` for
the rundown: 16 feature files, 45 scenarios, 182 steps. Coverage spans
per-role login, every dependency and media type, all seven Add media
forms, the media library admin and the full access-control matrix.

### Run locally

```bash
ddev start
ddev drush sql:drop -y
ddev drush site:install standard \
  --account-name=webmaster --account-pass=dD.123123ddd -y
ddev drush en webassets -y

yarn install
./node_modules/.bin/playwright install --with-deps chromium

LAUNCH_URL="https://<your-ddev>.ddev.site:33001" yarn test
yarn test:headed     # headed mode
```

### Run the GitLab pipeline locally

A slim `.gitlab-ci-local.yml` sidecar runs the same job in a Playwright
container joined to the DDEV network:

```bash
gitlab-ci-local \
  --file .gitlab-ci-local.yml \
  --network ddev-drupal11webassets_default \
  webship-js-test
```

### CI

The canonical pipeline at `.gitlab-ci.yml` runs on
[drupalci](https://git.drupalcode.org/project/gitlab_templates). The
first scenario provisions the per-role test users, so the CI
`before_script` only installs Drupal with the Webmaster super-admin
account.

## Issue queue and source

* Issues: <https://www.drupal.org/project/issues/webassets>
* Source: <https://git.drupalcode.org/project/webassets>
