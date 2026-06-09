---
name: research
description: Deep-research a topic and produce a structured report. Triggered by /research <topic>. Use for any research, investigation, or "look into X" request — technical or conceptual.
license: MIT
compatibility: opencode
---

# /research

Triggered by: `/research <topic>`

Produce a structured research report on the given topic. Adapt depth and sections to what's actually useful — drop sections that don't apply.

## Output format

```
## Research: <topic>

### Overview
2–4 sentences. What is it and why does it matter?

### How It Works
Core mechanics. Use code blocks or ASCII diagrams where they help.

### Key Concepts
- **Term** — one-line definition

### Use Cases
Concrete scenarios where this is the right choice.

### Tradeoffs
Honest downsides and when NOT to use it.

### Ecosystem
| Tool | Best for |
|------|----------|
| ...  | ...      |

### Quickstart
Minimal working example the user can run immediately.

### Further Reading
3–5 links: official docs, papers, or high-signal posts.
```

## Behaviour

- **Broad topic** (e.g. `/research AI`): pick the most useful angle and state it, or ask one clarifying question.
- **Comparison request** (e.g. `/research postgres vs sqlite`): lead with a side-by-side table.
- **No topic** (`/research` alone): ask "What would you like me to research?"
- **Technical topic**: include working code. **Conceptual topic**: use analogies.
