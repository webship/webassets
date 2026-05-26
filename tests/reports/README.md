# Cucumber reports

Run output from the webship-js suite. `cucumber.js` writes:

- `cucumber_report.json` — machine-readable JSON consumed by the HTML
  generator and CI tooling (JUnit, GitLab artefacts).
- `cucumber_report.html` — the HTML report rendered by webship-js's
  built-in formatter after each run.

Generated files are gitignored (see the project-root `.gitignore`); this
folder and the README are tracked so the layout is reproducible after a
fresh clone.
