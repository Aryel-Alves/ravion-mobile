---
name: flutter-offline-cache
description: "Use when: adding offline-first behavior in Flutter, local cache strategy, sync policies, conflict handling, and stale data management."
---

# Flutter Offline and Cache

## Goal

Keep the app usable with unstable or absent connectivity.

## Cache Policy

- Define cache scope by feature and data criticality.
- Track staleness (`updatedAt`, ttl/version) for cached entities.
- Prefer stale-while-revalidate for read-heavy features.

## Sync Guidance

- Queue write operations when offline when business rules allow.
- Use conflict resolution strategy per entity (last-write-wins or merge policy).
- Surface sync status in UI for user trust.

## Data Integrity

- Validate cached data schema version on app updates.
- Provide safe migration path for local storage changes.
