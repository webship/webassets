# Failed-scenario screenshots

webship-js captures a PNG every time a scenario fails. The `screenshot`
worldParameter in `cucumber.js` controls the filename pattern:

```
{datetime}.{feature_file}.feature_{step_line}.{ext}
```

Failed runs are prefixed with `failed_`. PNGs are gitignored; the folder
and README are tracked.
