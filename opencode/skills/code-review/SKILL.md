---
name: code-review
description: Review code for bugs, security issues, and quality problems. Use when the user asks to review, check, audit, or get feedback on code.
---

# Code Review

## Severity Scale
- Critical — correctness bugs, security vulnerabilities, data loss risk
- Warning — performance issues, error handling gaps, unclear logic
- Suggestion — naming, structure, maintainability

## Rules
- Lead with Critical findings; skip lower severities if none exist
- Cite the specific line or block, not the filename
- Explain *why* something is a problem, not just that it is
- Do not flag style unless a linter is absent or it causes ambiguity

## Output
### Verdict
`PASS` / `PASS WITH NOTES` / `NEEDS CHANGES`

### Findings
**label** — explanation + fix or example

### Summary
One sentence on overall code health.
