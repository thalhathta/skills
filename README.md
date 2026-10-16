# Skills for Reading AI Output

Agents now produce more output than we can comfortably read. Reviewing, checking and understanding that output is becoming the main job.

These skills change the *format* of what the model gives back, so it takes less effort to understand. The idea comes from a recent post by Andrej Karpathy: constrain text with ASD-STE100 (Simplified Technical English), and move past text to diagrams and throwaway interactive pages when they carry the idea better.

Each skill is small, single-purpose and easy to edit. Fork them and make them yours.

## The skills

| Skill | Use it for | Output |
|---|---|---|
| [`ste-review`](skills/ste-review/SKILL.md) | Code, PR, architecture, eval and long-output review | Verdict, terms table, findings by severity, single-action steps |
| [`explain-interactive`](skills/explain-interactive/SKILL.md) | Any concept with a parameter or mechanism | One disposable HTML page with 1–3 controls and a "Try this" box |
| [`diagram-first`](skills/diagram-first/SKILL.md) | Systems, pipelines, agent graphs, proposals | Mermaid diagram first, then a short walkthrough keyed to node names |

They follow one rough order of preference, from highest bandwidth to lowest:

1. **Interactive page**, when numbers or a mechanism are involved.
2. **Diagram**, when structure matters more than behaviour.
3. **Constrained text**, when text is the right format.

### What STE means here

The skills aim for roughly 80% of ASD-STE100: its writing rules, not its restricted dictionary.

- Instructions are 20 words or fewer.
- One action per instruction.
- One term per concept. No synonyms for variety.
- Active voice, numbers instead of adjectives, no filler.

`ste-review` is deliberately limited to output **you** read. It does not apply to emails, messages or anything you send to people, because that writing should sound human.

## Install

### Claude Code

```
/plugin marketplace add thalhathta/skills
/plugin install thalha-skills@thalha
```

### claude.ai (web, desktop, mobile)

1. Download the zips from the latest [release](https://github.com/thalhathta/skills/releases), or build them yourself with `./scripts/build-zips.sh`.
2. Open **Settings → Capabilities → Skills** and upload each zip.

### Other agents (Cursor, Codex, Copilot, Gemini CLI and more)

```
npx skills@latest add thalhathta/skills
```

Or copy any `skills/<name>/` folder into your agent's skills directory.

## Adapting them

- Edit the **Example topics** list in `explain-interactive` to match your field. It changes what the model reaches for.
- Edit the **Variants** in `diagram-first` to set your default frameworks and model providers.
- Keep the `description` line in each `SKILL.md` precise. It decides when the skill triggers.

## License

MIT
