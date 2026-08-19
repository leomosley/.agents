Use the available Playwright Chromium bundle:

```sh
bunx playwright screenshot --browser chromium --viewport-size "1440,1000" --full-page --wait-for-timeout 2500 <url> <output.png>
```

For mobile, set `--viewport-size "390,844"`. The device preset may select an
uninstalled WebKit build, so prefer an explicit Chromium viewport.
