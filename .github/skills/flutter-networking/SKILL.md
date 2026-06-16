---
name: flutter-networking
description: "Use when: implementing Flutter API clients, error handling, retries, timeouts, interceptors, and resilient network-driven UX."
---

# Flutter Networking

## Goal

Make network interactions resilient and predictable.

## Standards

- Set explicit connect/read timeouts.
- Map transport and server errors to domain-level failure types.
- Keep API DTOs isolated from UI models.
- Centralize auth headers, refresh flow, and logging via interceptors/middleware.

## Retry Strategy

- Retry only idempotent operations by default.
- Use bounded retry with backoff.
- Avoid retry storms on client-side validation errors or unauthorized states.

## UX Rules

- Never fail silently.
- Provide actionable error messages and retry actions in UI.
- Preserve partial data when possible.
