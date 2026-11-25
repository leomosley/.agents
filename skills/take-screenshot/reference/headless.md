Use the available Playwright Chromium bundle:

```sh
bunx playwright screenshot --browser chromium --viewport-size "1440,1000" --full-page --wait-for-timeout 2500 <url> <output.png>
```

For mobile, set `--viewport-size "390,844"`. The device preset may select an
uninstalled WebKit build, so prefer an explicit Chromium viewport.

If the CLI expects a newer browser than is cached, import the cached `playwright-core` directly and set `executablePath` to the existing Chromium binary. This worked on Linux on 2026-11-16:

```js
import { chromium } from '/home/mosly/.bun/install/cache/playwright-core@1.65.1@@@1/index.mjs';
const browser = await chromium.launch({ executablePath: '/home/mosly/.cache/ms-playwright/chromium-1248/chrome-linux64/chrome', headless: true });
const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
await page.goto(url, { waitUntil: 'networkidle' });
await page.waitForTimeout(5000);
await page.screenshot({ path: output, fullPage: true });
await browser.close();
```

Check the cached versions first. Direct Chromium `--virtual-time-budget` screenshots can be blank for the llama.cpp UI; use Playwright's real wait instead. No desktop authorization is needed.
