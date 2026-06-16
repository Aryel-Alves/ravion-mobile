---
name: flutter-accessibility
description: "Use when: improving Flutter accessibility, semantics, tap targets, screen reader support, focus order, and contrast compliance."
---

# Flutter Accessibility

## Goal

Ship interfaces usable by everyone, including assistive technology users.

## Must-Haves

- Ensure tappable targets follow platform guidance:
  - Android: minimum `48x48`
  - iOS: minimum `44x44`
- Add meaningful semantics labels to icon-only actions.
- Ensure reading and focus order matches visual and logical flow.
- Avoid color-only communication for status or validation.

## Testing Guidance

- Add widget tests with `meetsGuideline(...)` where possible:
  - `androidTapTargetGuideline`
  - `iOSTapTargetGuideline`
  - `labeledTapTargetGuideline`
  - `textContrastGuideline`

## Review Checklist

- Can core flows be completed with TalkBack/VoiceOver?
- Are all interactive controls discoverable by semantics?
- Is contrast acceptable for text and controls?
