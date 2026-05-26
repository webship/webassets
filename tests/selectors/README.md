# Selectors

JSON files consumed by webship-js's selector registry (`worldParameters.selectors.files`
in `cucumber.js`). Each file groups CSS / XPath selectors for one theme so
the same step phrases can target Drupal Core (Claro) and Drupal CMS (Gin)
without re-writing scenarios.

| File | Theme |
|------|-------|
| `cms-drupal-core-claro.json` | Drupal Core admin theme (Claro). |
| `cms-drupal-cms-gin.json` | Drupal CMS admin theme (Gin). |
