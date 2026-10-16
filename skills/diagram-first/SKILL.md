---
name: diagram-first
description: Use when the user asks to design, explain or review a system, pipeline, workflow or architecture (services, data or ML pipelines, multi-agent systems, solution proposals). Leads with a Mermaid or SVG diagram, then short text keyed to its labels.
---

# Diagram First

Goal: show structure spatially first, then explain only what the diagram cannot show.

## When to use
- System architecture, data and ML pipelines, deployment topology.
- Multi-agent and agent-graph designs.
- Decision flows and service call sequences.
- Solution overviews for proposals.

## When NOT to use
- Questions about one component or one function.
- Code-level bugs. Use `ste-review` for those.

## Pick the diagram type
| Question | Diagram |
|---|---|
| How do the parts connect? | Mermaid `flowchart LR` |
| What happens in order between services? | `sequenceDiagram` |
| Which states does an item pass through? | `stateDiagram-v2` |
| Agent graph | `flowchart`: nodes are agents or tools, edges labelled with the routing condition |
| Project phases | `gantt` or `timeline` |
| Where does each part run? | `flowchart` with one subgraph per location (device, cloud, client) |

## Diagram rules
- Diagram comes first, before any text.
- Maximum about 12 nodes. If the system is larger, draw an overview, then one zoomed diagram of the critical part.
- Label every edge with what moves along it: data type, message or trigger.
- Group nodes in subgraphs by location or owner.
- Node names are the official names. Use the same names in all text that follows.
- Mark unknowns with "?" in the label and list them after the diagram.
- Output Mermaid in a fenced block, or as a rendered artifact where the app supports it. Use SVG only when Mermaid cannot produce the layout or annotations needed.

## Text after the diagram
- **Walkthrough**: numbered steps along the main path, one step per edge. Use node names. 20 words or fewer per step, one action each.
- **Decisions and risks**: 5 bullets maximum.
- **Unknowns**: only if the diagram has "?" labels.
- Do not write a paragraph that re-describes the diagram.

## Variants
- **Client version** (when the user says client, proposal or pitch): hide internals such as model names, thresholds and infrastructure. Show what the client provides, what the system does, and what the client receives. Use plain words.
- **Agent systems**: prefer the frameworks and model providers the user already uses. If none are stated, default to open-source orchestration (for example LangGraph or CrewAI) and say which model API the design assumes.
