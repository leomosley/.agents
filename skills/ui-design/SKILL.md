---
name: ui-design
description: Use when building or styling a UI in Linear's dark, restrained, software-craft aesthetic — a near-black canvas with a single lavender-blue accent, a four-step surface ladder, and negative-tracking display type.
---

## Overview

Linear's marketing canvas is the deepest dark surface in this collection — `{colors.canvas}` is "#010102", essentially pure black with a faint blue tint. On top sits a four-step surface ladder (`{colors.surface-1}` through `{colors.surface-4}`) for cards, panels, and lifted tiles, with hairline borders running from `{colors.hairline}` ("#23252a") up through `{colors.hairline-strong}` and `{colors.hairline-tertiary}`. Light gray text (`{colors.ink}` "#f7f8f8") carries the body and headlines.

The single chromatic accent is **Linear lavender-blue** `{colors.primary}` ("#5e6ad2") — used on the brand mark, focus rings, and the primary CTA button. A lighter hover state (`{colors.primary-hover}` "#828fff") and a focus-tinted variant (`{colors.primary-focus}` "#5e69d1") extend the same hue. Linear avoids saturated greens, oranges, reds, etc. on the marketing canvas — the only semantic color is `{colors.semantic-success}` ("#27a644") for status pills and the rare success indicator.

Display type runs Linear's custom sans (with `SF Pro Display` fallback) at weight 500-700 with negative letter-spacing scaling from -3.0px at 80px down to 0 at body. The body family is Linear's text cut, and a Linear Mono is reserved for code snippets in product screenshots.

The page rhythm is **dense product screenshots** — Linear's marketing leads with high-fidelity captures of the product UI (issue list, project view, dashboard) framed in `{colors.surface-1}` panels with `{rounded.xl}` 16px corners. The chrome is intentionally minimal so the app screenshots can do the heavy lifting.

**Key Characteristics:**
- **Dark-canvas marketing system** — `{colors.canvas}` ("#010102") is the deepest dark in this collection.
- **Lavender-blue brand accent** (`{colors.primary}` "#5e6ad2") — used scarcely on brand mark, focus, and the primary CTA.
- Four-step surface ladder (canvas → surface-1 → surface-2 → surface-3 → surface-4) carries hierarchy without shadow.
- Display tracking pulls aggressively negative (-3.0px at 80px); body holds at -0.05px.
- Cards use `{rounded.lg}` 12px corners with 1px hairline borders — never pill, rarely 16px.
- **Product UI screenshots** dominate the page. The marketing chrome is a dark frame for the app.
- No second chromatic color. No atmospheric gradients. No spotlight cards.

## Design Tokens

### Colors — Dark (default)

```yaml
primary: "#5e6ad2"
on-primary: "#ffffff"
primary-hover: "#828fff"
primary-focus: "#5e69d1"
ink: "#f7f8f8"
ink-muted: "#d0d6e0"
ink-subtle: "#8a8f98"
ink-tertiary: "#62666d"
canvas: "#010102"
surface-1: "#0f1011"
surface-2: "#141516"
surface-3: "#18191a"
surface-4: "#191a1b"
hairline: "#23252a"
hairline-strong: "#34343a"
hairline-tertiary: "#3e3e44"
inverse-canvas: "#ffffff"
inverse-surface-1: "#f5f6f6"
inverse-surface-2: "#f6f7f7"
inverse-ink: "#000000"
brand-secure: "#7a7fad"
semantic-success: "#27a644"
semantic-overlay: "#000000"
```

### Colors — Light

Mirrors Linear's product light theme: white canvas, an inverted four-step surface ladder in cool grays, dark ink hierarchy, and soft gray hairlines. The lavender-blue accent is unchanged — it carries across both themes. The primary CTA on light darkens slightly on hover for contrast against the pale canvas.

```yaml
primary: "#5e6ad2"
on-primary: "#ffffff"
primary-hover: "#4c58c0"
primary-focus: "#5e69d1"
ink: "#08090a"
ink-muted: "#3c4149"
ink-subtle: "#6b6f76"
ink-tertiary: "#8a8f98"
canvas: "#ffffff"
surface-1: "#fbfbfb"
surface-2: "#f4f5f8"
surface-3: "#eeeff1"
surface-4: "#e7e8ea"
hairline: "#e9eaeb"
hairline-strong: "#dcdddf"
hairline-tertiary: "#cccdd0"
inverse-canvas: "#08090a"
inverse-surface-1: "#141516"
inverse-surface-2: "#191a1b"
inverse-ink: "#ffffff"
brand-secure: "#5c6488"
semantic-success: "#1a7f37"
semantic-overlay: "#000000"
```

### Typography

```yaml
display-xl:  { fontFamily: Linear Display, fontSize: 80px, fontWeight: 600, lineHeight: 1.05, letterSpacing: -3.0px }
display-lg:  { fontFamily: Linear Display, fontSize: 56px, fontWeight: 600, lineHeight: 1.10, letterSpacing: -1.8px }
display-md:  { fontFamily: Linear Display, fontSize: 40px, fontWeight: 600, lineHeight: 1.15, letterSpacing: -1.0px }
headline:    { fontFamily: Linear Display, fontSize: 28px, fontWeight: 600, lineHeight: 1.20, letterSpacing: -0.6px }
card-title:  { fontFamily: Linear Display, fontSize: 22px, fontWeight: 500, lineHeight: 1.25, letterSpacing: -0.4px }
subhead:     { fontFamily: Linear Display, fontSize: 20px, fontWeight: 400, lineHeight: 1.40, letterSpacing: -0.2px }
body-lg:     { fontFamily: Linear Text, fontSize: 18px, fontWeight: 400, lineHeight: 1.50, letterSpacing: -0.1px }
body:        { fontFamily: Linear Text, fontSize: 16px, fontWeight: 400, lineHeight: 1.50, letterSpacing: -0.05px }
body-sm:     { fontFamily: Linear Text, fontSize: 14px, fontWeight: 400, lineHeight: 1.50, letterSpacing: 0 }
caption:     { fontFamily: Linear Text, fontSize: 12px, fontWeight: 400, lineHeight: 1.40, letterSpacing: 0 }
button:      { fontFamily: Linear Text, fontSize: 14px, fontWeight: 500, lineHeight: 1.20, letterSpacing: 0 }
eyebrow:     { fontFamily: Linear Text, fontSize: 13px, fontWeight: 500, lineHeight: 1.30, letterSpacing: 0.4px }
mono:        { fontFamily: Linear Mono, fontSize: 13px, fontWeight: 400, lineHeight: 1.50, letterSpacing: 0 }
```

### Rounded

```yaml
xs: 4px
sm: 6px
md: 8px
lg: 12px
xl: 16px
xxl: 24px
pill: 9999px
full: 9999px
```

### Spacing

```yaml
xxs: 4px
xs: 8px
sm: 12px
md: 16px
lg: 24px
xl: 32px
xxl: 48px
section: 96px
```

### Components

```yaml
button-primary:          { backgroundColor: "{colors.primary}", textColor: "{colors.on-primary}", typography: "{typography.button}", rounded: "{rounded.md}", padding: 8px 14px }
button-primary-pressed:  { backgroundColor: "{colors.primary-focus}", textColor: "{colors.on-primary}", typography: "{typography.button}", rounded: "{rounded.md}" }
button-primary-hover:    { backgroundColor: "{colors.primary-hover}", textColor: "{colors.on-primary}", typography: "{typography.button}", rounded: "{rounded.md}" }
button-secondary:        { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.button}", rounded: "{rounded.md}", padding: 8px 14px }
button-tertiary:         { backgroundColor: "{colors.canvas}", textColor: "{colors.ink}", typography: "{typography.button}", rounded: "{rounded.md}", padding: 8px 14px }
button-inverse:          { backgroundColor: "{colors.inverse-canvas}", textColor: "{colors.inverse-ink}", typography: "{typography.button}", rounded: "{rounded.md}", padding: 8px 14px }
pricing-card:            { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.lg}", padding: 24px }
pricing-card-featured:   { backgroundColor: "{colors.surface-2}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.lg}", padding: 24px }
feature-card:            { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.lg}", padding: 24px }
product-screenshot-card: { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.xl}", padding: 24px }
testimonial-card:        { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.body-lg}", rounded: "{rounded.lg}", padding: 32px }
customer-logo-tile:      { backgroundColor: "{colors.canvas}", textColor: "{colors.ink-subtle}", typography: "{typography.caption}", rounded: "{rounded.xs}", padding: 16px }
text-input:              { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.md}", padding: 8px 12px }
text-input-focused:      { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.md}", padding: 8px 12px }
pricing-tab-default:     { backgroundColor: "{colors.canvas}", textColor: "{colors.ink-subtle}", typography: "{typography.button}", rounded: "{rounded.pill}", padding: 6px 14px }
pricing-tab-selected:    { backgroundColor: "{colors.surface-2}", textColor: "{colors.ink}", typography: "{typography.button}", rounded: "{rounded.pill}", padding: 6px 14px }
cta-banner:              { backgroundColor: "{colors.surface-1}", textColor: "{colors.ink}", typography: "{typography.headline}", rounded: "{rounded.lg}", padding: 48px }
changelog-row:           { backgroundColor: "{colors.canvas}", textColor: "{colors.ink}", typography: "{typography.body}", rounded: "{rounded.xs}", padding: 24px 0 }
status-badge:            { backgroundColor: "{colors.surface-2}", textColor: "{colors.ink-muted}", typography: "{typography.caption}", rounded: "{rounded.pill}", padding: 2px 8px }
top-nav:                 { backgroundColor: "{colors.canvas}", textColor: "{colors.ink}", typography: "{typography.body-sm}", rounded: "{rounded.xs}", height: 56px }
footer:                  { backgroundColor: "{colors.canvas}", textColor: "{colors.ink-subtle}", typography: "{typography.caption}", rounded: "{rounded.xs}", padding: 64px 32px }
```

## Known Gaps

- The four-step surface ladder values are extracted directly from Linear's `--color-bg-level-3`, `--color-line-tint`, etc. CSS variables; they are Linear's canonical surface spec.
- Form-field error and validation styling is not visible on the inspected pages.
- The marketing site is dark-only; the light palette above is derived from Linear's product light theme, not the marketing canvas.
- Linear's actual product UI uses a richer color-tag palette (red, orange, yellow, green, blue, purple) for issue priorities and project labels — those colors live in the in-product surfaces shown in mockups.
- The custom display, text, and mono families are proprietary; an open-source substitute is acceptable.
