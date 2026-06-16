---
name: flutter-performance
description: "Use when: optimizing Flutter rendering and startup performance, reducing rebuilds, improving list performance, and profiling jank."
---

# Flutter Performance

## Goal

Avoid common performance pitfalls and keep UI smooth.

## Core Practices

- Use `const` constructors whenever possible.
- Split widgets to reduce rebuild scope.
- Avoid expensive work inside `build()`.
- Prefer lazy lists (`ListView.builder`, `SliverList`) for large collections.
- Debounce high-frequency input events when tied to network requests.

## Profiling

- Profile in profile/release mode for realistic behavior.
- Use DevTools timeline and frame chart before and after changes.
- For critical flows, use integration tests with `traceAction` and compare metrics.

## Done Criteria

- Measurable improvement or no regression on target flow.
- No new obvious jank under expected data volume.
