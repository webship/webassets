# Web Assets

Manage local and remote media assets. Provides the needed configuration on top
of Drupal core's media management and media library so a fresh site has a
production-ready set of media types, image styles, responsive image styles and
breakpoints — without hand-clicking through the admin UI.

Web Assets is part of the [Webship](https://webship.co) toolkit and follows
the same recipe-on-install pattern as Webpage, Webblog and Webseo: enabling
the module imports a Drupal Recipe that wires every dependency together.

## Key features

* **Seven media types out of the box** — Image, Document, Audio, Video,
  Remote audio, Remote image, Remote video. Form and view displays are
  pre-configured for the default and Media Library view modes.
* **Five responsive image styles** — `origenal`, `square`, `standard`,
  `traditional`, `ultrawide` — each mapped across the eight Web Assets
  breakpoints (`sm`, `md`, `lg`, `xl`, `nav-md`, `nav`, `grid-md`, `grid-max`).
* **Curated image style derivatives** for every aspect ratio (tiny / small /
  medium / large / xlarg / xxlarg / xxxlarg) so themes can pick the right
  crop at the right breakpoint without defining new styles.
* **Crop + Focal Point integration** for art-directed crops on the Image
  media type.
* **Remote audio + remote image** support via the
  [Media Remote Audio](https://www.drupal.org/project/media_remote_audio)
  and [Media Remote Image](https://www.drupal.org/project/media_remote_image)
  modules — both use the core oEmbed pipeline (mirroring core's
  `oembed:video`), so Remote audio, Remote image and Remote video are
  fully symmetric in admin UI and config.
* **Layout Builder enabled** on the Image bundle's `standard` view mode so
  the responsive image renders through Layout Builder sections by default.
* **Recipe-driven** — all of the above is applied via
  `recipes/default/recipe.yml`, executed by `hook_install()`. Re-runnable
  and overridable per site.

## Dependencies

Declared in `webassets.info.yml`:

| Module | Source |
|--------|--------|
| `file`, `path`, `image`, `media`, `media_library`, `responsive_image`, `layout_builder`, `layout_discovery` | Drupal core (~11.3) |
| [`crop`](https://www.drupal.org/project/crop) | Contrib |
| [`focal_point`](https://www.drupal.org/project/focal_point) | Contrib |
| [`media_remote_audio`](https://www.drupal.org/project/media_remote_audio) | Contrib |
| [`media_remote_image`](https://www.drupal.org/project/media_remote_image) | Contrib |

Composer also pulls [`media_directories`](https://www.drupal.org/project/media_directories)
and [`webpatches`](https://www.drupal.org/project/webpatches) as transitive
requirements.

## Installation

```bash
composer require drupal/webassets
drush en webassets -y
drush cache:rebuild
```

Enabling the module runs `recipes/default/recipe.yml`, which:

1. Enables every required core + contrib module listed above.
2. Imports the bundled `crop`, `focal_point` and `media_remote_audio`
   configuration with `strict: false` (so existing customisations on the
   target site are preserved).
3. Installs the six Web Assets media types, their fields, form displays,
   view displays, view modes, image styles, responsive image styles and
   breakpoints.

## Recipe

Web Assets is itself shipped as a Drupal Recipe (`recipes/default/`) and can
be applied with `core/scripts/drupal recipe` against any Drupal 11.3+
installation that does not already have the module enabled.

```bash
php core/scripts/drupal recipe modules/contrib/webassets/recipes/default
```

## Breakpoints

`webassets.breakpoints.yml` registers eight breakpoints:

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

Themes can declare a `breakpoints` group named `webassets` to reuse them
in their own responsive image styles.

## Testing

Web Assets ships a [webship-js](https://www.npmjs.com/package/webship-js)
(Playwright + Cucumber-js) BDD suite under `tests/`. See `tests/README.md`
for the full breakdown — the headline numbers are **15 feature files /
40 scenarios / 164 steps** covering:

* per-role login + automatic provisioning of `content_editor_user` and
  `authenticated_user`,
* the presence of every dependency module, media type, responsive image
  style and image style derivative,
* the Add forms for all six media bundles (including the oEmbed Video URL
  field on Remote video),
* the media library admin listing,
* the full access-control matrix across Webmaster, content editor,
  authenticated user and anonymous.

### Run locally

```bash
# 1. Have the DDEV site up with the module enabled
ddev start
ddev drush sql:drop -y
ddev drush site:install standard \
  --account-name=webmaster --account-pass=dD.123123ddd -y
ddev drush en webassets -y

# 2. Install deps once
yarn install
./node_modules/.bin/playwright install --with-deps chromium

# 3. Run the suite
LAUNCH_URL="https://<your-ddev>.ddev.site:33001" yarn test
yarn test:headed                                 # headed mode
```

### Run the GitLab pipeline locally

A slim sidecar `.gitlab-ci-local.yml` mirrors the canonical
`webship-js-test` job in a single Playwright container that joins DDEV's
docker network:

```bash
gitlab-ci-local \
  --file .gitlab-ci-local.yml \
  --network ddev-drupal11webassets_default \
  webship-js-test
```

### CI

The canonical pipeline lives at `.gitlab-ci.yml` and runs on
[drupalci](https://git.drupalcode.org/project/gitlab_templates). The
first scenario provisions the per-role test users, so the CI
`before_script` only needs to install Drupal with the Webmaster
super-admin account.

## Issue queue & source

* Issues: <https://www.drupal.org/project/issues/webassets>
* Source: <https://git.drupalcode.org/project/webassets>
