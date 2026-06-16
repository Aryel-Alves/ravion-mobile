---
name: flutter-security
description: "Use when: handling secrets, tokens, secure storage, input validation, privacy-sensitive data, and mobile app security hardening in Flutter."
---

# Flutter Security

## Goal

Protect user data and reduce common mobile attack surfaces.

## Key Practices

- Never hardcode secrets in source code.
- Store tokens/credentials in secure storage.
- Minimize personally identifiable data at rest.
- Validate and sanitize user input before processing.

## Transport and Auth

- Require TLS for API traffic.
- Handle token refresh safely and invalidate compromised sessions.
- Clear sensitive local data on logout.

## Logging

- Avoid logging secrets, tokens, or personal data.
- Redact sensitive fields in debug and error logs.
