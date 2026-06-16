---
name: flutter-state-management
description: "Use when: implementing state management in Flutter screens, defining UI states, loading-success-error flows, and avoiding business logic inside widgets."
---

# Flutter State Management

## Goal

Keep state explicit, predictable, and easy to test.

## Core Guidance

- Use one primary state pattern consistently across the app.
- Model screen state as sealed states or discriminated states:
  - `initial`
  - `loading`
  - `success(data)`
  - `empty`
  - `error(message)`
- Keep mutation logic in controller/notifier/cubit, not in widget trees.

## Rules

- Widgets only render state and dispatch intents.
- Side effects (network, storage, analytics) stay outside widget build methods.
- Expose derived UI flags from state rather than recomputing in multiple widgets.
- Reset transient states intentionally after one-shot actions.

## Review Checklist

- Is state source-of-truth unique for the screen?
- Are loading and error states handled in UI?
- Can state transitions be unit-tested without rendering widgets?
