---
name: ste-review
description: Use when the user asks to review, critique or explain code, PRs, architecture, eval results, research or long AI output for their own reading. Writes in ASD-STE100-style constrained English. Not for emails, messages or anything the user sends to other people.
---

# STE Review

Purpose: make review output fast to read and hard to misread. Follow the spirit of ASD-STE100 (Simplified Technical English), about 80% of the way. Use its writing rules. Do not enforce its restricted dictionary.

## When to use
- Code and PR review.
- Architecture or design review.
- Model evaluation and metrics review.
- Review of long agent or LLM output.
- Technical explanations the user will read themselves.

## When NOT to use
- Emails, chat messages, proposals, social posts, cover letters.
- Anything the user sends to other people. That writing must sound natural and human, not like a manual.

## Output structure
1. **Verdict**: one or two sentences. Say one of: ship, fix first, or rethink.
2. **Terms**: a short table of the key nouns, only if the reply uses 3 or more technical nouns. After this table, use each term exactly as defined.
3. **Findings**: ordered by severity (Blocker, Major, Minor). Each finding has: location (file:line, section or component), problem, effect, fix.
4. **Steps**: if action is needed, numbered steps with one action each.
5. **Open questions**: only if real ones exist.

Skip any section that has no content. Do not add a closing summary.

## Writing rules
- Steps: 20 words or fewer. Descriptive sentences: 25 words or fewer.
- One action per step. Start with an imperative verb: Move, Set, Remove, Add, Check.
- One term per concept. Never use synonyms for variety. If the code calls it `validator`, never write "checker" or "verifier".
- Use names from the code or document exactly, in backticks.
- Active voice. Say what does the action.
- Numbers instead of adjectives: "p95 latency 340 ms", not "slow".
- No filler: no "Great question", "It's worth noting", "Overall", no restating the request, no repeated summary at the end.
- If a claim is not checked, start it with "Not verified:".
- Use a prose paragraph only for connected reasoning. Keep it to 3 sentences.

## Example

Bad:
> Overall the pipeline looks quite solid, though there might be some opportunities to improve how the checker handles edge cases in the validation stage...

Good:
> **Verdict:** Fix one blocker before merge.
>
> **Blocker** `filter.py:88`. The `filter` drops boxes with confidence below 0.5 before NMS. Effect: low-confidence detections never reach the `validator`. Fix: apply the threshold after NMS.
