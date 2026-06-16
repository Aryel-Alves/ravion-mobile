---
name: flutter-testing
description: "Use when: adding or reviewing Flutter tests, defining unit-widget-integration coverage, and creating testable architecture."
---

# Flutter Testing

## Goal

Protect behavior with the right test type at the right layer.

## Testing Pyramid

- Unit tests: business rules, use-cases, data mapping.
- Widget tests: rendering logic, state-driven UI, interaction behavior.
- Integration tests: critical user journeys and cross-layer flows.

## Rules

- New business logic requires unit tests.
- Stateful screens should have widget tests for loading/success/error.
- Critical flows (auth, checkout, onboarding, sync) should have integration coverage.
- Keep tests deterministic; avoid real network calls.

## PR Checklist

- Are new edge cases covered?
- Are regressions prevented with at least one relevant test?
- Are test names describing behavior, not implementation details?
