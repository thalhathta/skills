---
name: explain-interactive
description: Use when the user wants to understand or teach a concept that has numbers, parameters or a mechanism (optimisation, thresholds, metrics, algorithms, ML training, retrieval). Builds one throwaway interactive HTML page instead of a text explanation.
---

# Interactive Explainer

Goal: transfer one insight in under a minute of play. The page is disposable. Optimise for clarity, not reuse or polish.

## When to use
- "Explain / show me / help me understand how X affects Y" where X is a parameter or setting.
- Teaching material for students, colleagues or an expert audience.

## When NOT to use
- Pure definitions, history, opinions, or anything without a mechanism to play with. Answer in short text.

## Process
1. Name the single insight in one sentence. Example: "A higher learning rate overshoots the minimum." If the request has several insights, build the main one and list the others as follow-ups.
2. Choose 1 to 3 controls. More controls hide the insight.
3. Choose one visual that changes immediately on input: canvas animation, plot, shapes on a synthetic image, or a table that recolours.
4. Build the page. In a chat app with artifacts, publish it as an HTML artifact. In a coding agent, write one local `.html` file and tell the user the path.
5. In the reply, write one line on what to try first. Example: "Drag the learning rate above 1.0 and watch it diverge." Add nothing else unless asked.

## Page rules
- One self-contained HTML file. Vanilla JS with canvas or SVG. Inline CSS. Use a CDN library only if it is essential.
- No network data. Generate synthetic data in the page with a fixed seed.
- Update live on input. No "Run" button unless the computation is heavy.
- Show the current value next to each control.
- Add a "Try this" box with 2 or 3 specific settings. At least one setting must break the method.
- One caption under the visual, 2 sentences maximum, in short direct sentences.
- If a key formula or rule exists, show it in one line.
- Add a Reset button.
- Layout must work at phone width.

## Teaching mode
Use when the audience is learners or experts being taught, or when the user says "teaching mode".
- Show the naive method failing first. Add a toggle to switch to the better method.
- Add a "Predict first" step: the viewer guesses the outcome before the page reveals it.
- Keep the failure case and the fix side by side.
- Pitch it to challenge the stated audience, not only beginners.

## Example topics
- Learning rate, momentum and warmup on a loss surface.
- Confidence and IoU thresholds on detection boxes; NMS behaviour.
- Precision, recall and F1 as a decision threshold moves.
- LoRA rank and alpha against trainable parameter count.
- RAG chunk size and top-k; retrieval failure modes.
- Hash table load factor and collisions; cache eviction policies.
