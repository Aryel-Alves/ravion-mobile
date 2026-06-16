---
name: flutter-ci-quality
description: "Use when: setting up or improving Flutter CI/CD quality gates, including format, lint, tests, coverage, and build validation."
---

# Flutter CI and Quality Gates

## Goal

Automate quality checks so regressions are blocked early.

## Minimum Pipeline

- `dart format --set-exit-if-changed .`
- `flutter analyze`
- `flutter test`
- Build validation for target platforms used by the team.

## Quality Gates

- Fail PR on lint or test failures.
- Enforce minimum coverage for critical modules.
- Require green CI before merge.

## Team Workflow

- Keep CI feedback fast with caching and parallel jobs.
- Separate quick checks from slower release checks.
- Version and document release process per environment.
