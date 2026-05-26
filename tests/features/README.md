# Web Assets - webship-js feature scenarios

| File | Covers |
|------|--------|
| `01-01-01-users-login.feature` | Per-role login (Webmaster + provisioning, content editor, authenticated user). |
| `02-01-01-webassets-module-enabled.feature` | Web Assets module + Media / Library / Responsive Image / Layout Builder / Crop / Focal Point / Remote Audio / Remote Image are enabled. |
| `02-02-01-media-types-installed.feature` | All seven media types (Audio, Document, Image, Remote audio, Remote image, Remote video, Video) and their edit forms. |
| `02-03-01-responsive-image-styles.feature` | Origenal / Square / Standard / Traditional / Ultrawide responsive styles + edit forms. |
| `02-04-01-image-styles.feature` | Web Assets image style derivatives (small / medium / large / xlarg etc.) appear in the image styles list. |
| `02-05-01-breakpoints.feature` | Web Assets breakpoints are exposed to the responsive image style add form. |
| `03-01-01-media-add-image.feature` | Add Image form + the `/media/add` chooser lists all seven bundles. |
| `03-02-01-media-add-document.feature` | Add Document form. |
| `03-03-01-media-add-remote-video.feature` | Add Remote video form (oEmbed Video URL field). |
| `03-04-01-media-add-audio.feature` | Add Audio form. |
| `03-05-01-media-add-video.feature` | Add Video form. |
| `03-06-01-media-add-remote-audio.feature` | Add Remote audio form. |
| `03-07-01-media-add-remote-image.feature` | Add Remote image form (oembed:image, Flickr / GIPHY / Getty). |
| `04-01-01-media-library-admin.feature` | `/admin/content/media` listing + media-grid view are reachable. |
| `05-01-01-access-control.feature` | Anonymous users are denied on media admin / media types / image styles / responsive image styles. |
| `05-02-01-role-access-matrix.feature` | Full access matrix across Webmaster, content editor, authenticated user, anonymous. |

## Running the suite

```bash
yarn test                          # all features
yarn test:headed                   # headed mode (HEADLESS=false)
```

## Test users

`cucumber.js` registers three users for `worldParameters.users`:

| Key | Username | Roles | Provisioned by |
|-----|----------|-------|----------------|
| `Webmaster` | `webmaster` | super-admin | `drush site:install --account-name=webmaster --account-pass=dD.123123ddd` |
| `Content editor` | `content_editor_user` | `content_editor` | First scenario, via `Given I add testing users` |
| `Authenticated user` | `authenticated_user` | _none_ | First scenario, via `Given I add testing users` |

All passwords are `dD.123123ddd`. The first scenario in
`01-01-01-users-login.feature` logs in as Webmaster and provisions every
non-admin user, so no separate drush step is required in CI.
