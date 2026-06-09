---
name: git-commit
description: Review staged changes and suggest a conventional commit message. Use when the user wants to commit, write a commit message, or asks what to call their changes.
---

# Git Commit Assistant
Review `git diff --staged` (fall back to `git diff` if empty).

## Flags
Warn if you find: debug code, console/log statements, disabled code blocks, changes unrelated to a single intent.

## Rules
- Conventional Commits format and types
- lowercase, imperative mood, under 72 chars
- use scope when obvious from file path or module
- describe intent, not filenames

## Output
### Summary
...
### Warnings
...
### Commit
`type(optional scope): description`
