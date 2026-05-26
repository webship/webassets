# Scenario videos

webship-js records a Playwright `.webm` for each scenario in
`mode: 'on-failure'` (see the `video` worldParameter in `cucumber.js`).
Passing scenarios discard their recording; failing scenarios keep it,
named:

```
{datetime}.{feature_file}.{scenario}.{status}.{ext}
```

`.webm` files are gitignored; the folder and README are tracked.
