---
name: flutter-ui-system
description: "Use when: creating or refactoring Flutter UI components, theming, design tokens, spacing, typography, and consistent component states."
---

# Flutter UI System

## Goal

Build consistent and reusable UI with a clear design system.

## Design Tokens

- Centralize tokens in theme extensions or dedicated token classes.
- Define semantic colors (for example `success`, `warning`, `surfaceMuted`) instead of raw color usage.
- Keep spacing scale fixed and reuse constants.
- Use consistent typography styles via `TextTheme`.

## Component Standards

- Every reusable component should support at least:
  - `enabled`
  - `disabled`
  - `loading` (when meaningful)
  - `error` (for inputs or feedback components)
- Prefer small composable widgets over giant configurable widgets.
- Avoid hardcoded paddings, fonts, and colors in feature pages.

## UI Quality Checks

- Layout behaves on small and large screens.
- Long text and localization do not break layout.
- Empty/error/loading states are designed, not placeholders.
