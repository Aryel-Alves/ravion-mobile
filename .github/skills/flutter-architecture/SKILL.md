---
name: flutter-architecture
description: "Use when: defining or refactoring Flutter project structure, feature-first organization, layer boundaries, dependency direction, maintainability, and scalability."
---

# Flutter Architecture

## Goal

Design and preserve a feature-first architecture that keeps code testable, scalable, and easy to change.

## Default Structure

- Organize by feature first: `lib/features/<feature_name>/...`
- Keep shared code under `lib/core/` and `lib/shared/`.
- Use layers inside each feature:
  - `presentation/`: widgets, pages, controllers/viewmodels
  - `domain/`: entities, use-cases, repository contracts
  - `data/`: datasources, DTOs, repository implementations

## Rules

- Dependency direction is inward only: `presentation -> domain <- data`.
- Domain must not import Flutter UI packages.
- Avoid cross-feature imports except via explicit shared/domain contracts.
- Keep use-cases small and named by action, for example `CreateOrderUseCase`.

## When Writing Code

- Place new files in the proper feature and layer.
- If introducing a new dependency across layers, justify it and keep boundaries clean.
- Prefer composition over inheritance in UI and service abstractions.
- Keep business logic out of widgets.

## Done Criteria

- New code follows feature-first structure.
- Layering rules are respected.
- Responsibilities are clear and testable.
