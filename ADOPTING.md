# Adopting Agis Method

Two ways to adopt, plus platform requirements. **If you already have a project with its own
`CLAUDE.md` / `.claude/settings.json`, use Path B — do NOT clone over it.**

## Requirements
- **bash** — native on macOS/Linux; on **Windows** use Git Bash or WSL (Claude Code must be able to run `bash …`)
- **python 3.x** — either `python3` or `python`; the hooks auto-detect whichever exists
- **Claude Code**

## Path A — new / greenfield
You have no existing assistant project. Just follow the Quick Start in the README:
`git clone` → `bash setup.sh` → `claude`. Done.

## Path B — merge into an EXISTING project
Your project already has a `CLAUDE.md`, hooks, skills, or a memory system. **Cherry-pick, don't overwrite:**

1. **Hooks (the core value).** Copy this kit's `scripts/` folder into your project. Then open your
   existing `.claude/settings.json` and **append** the hook entries from this kit's
   `.claude/settings.json` into your `UserPromptSubmit` / `PostToolUse` arrays — do not replace the
   arrays. If you already have hooks, both sets run.
2. **CLAUDE.md.** Do **not** overwrite it. Copy just the sections you want — the **Process Gate (⛔)**
   and **Lesson Loop (🔁)** — and paste them into your existing `CLAUDE.md`.
3. **Lessons ledger.** Copy `context/admin/lessons.md` if you don't already keep one.
4. **Skills.** Copy only the skills you don't already have into `.claude/skills/`. Skip duplicates
   (Claude Code ships some of these as built-ins).
5. **Memory / wiki / teams.** Optional. Adopt the structure only if you want it. If you already have a
   memory system, keep yours — don't create a parallel one.
6. **Do NOT run `setup.sh` in Path B.** It rewrites the kit's *own* `CLAUDE.md`, not yours. Just fill
   your identity into your existing files by hand.

> **Minimum high-value adoption:** the two gate hooks (Process Gate + Lesson Loop) plus their two
> `CLAUDE.md` sections. Everything else is optional — add it later if you find it useful.

## Using with an AI tool other than Claude Code
The method's **rules are just text** — the portable core lives in `AGENTS.md` (tool-agnostic) and
`CLAUDE.md` (Claude Code flavor). Put those rules into whatever file your tool auto-reads:

| Your AI tool | Rules file it commonly auto-reads |
|---|---|
| Claude Code | `CLAUDE.md` (+ hooks via `.claude/settings.json`) |
| Codex / tools on the AGENTS.md standard | `AGENTS.md` |
| Cursor | `.cursor/rules/*.mdc` (or legacy `.cursorrules`) |
| Windsurf | `.windsurf/rules/` (or legacy `.windsurfrules`) |
| Cline / Roo Code | `.clinerules` (file or folder) |
| Gemini CLI | `GEMINI.md` |
| GitHub Copilot | `.github/copilot-instructions.md` |
| aider | `CONVENTIONS.md` (loaded via config/`--read`) |

> ⚠️ These conventions change often — **check your tool's current docs** for the exact path.
> The fastest route: open `PROMPT.md` and paste the adopt-prompt into your AI; it will place the rules
> in the right file for you.

**What is / isn't portable:**
- ✅ **Portable to any AI:** all the *rules* (Process Gate, Lesson Loop, Second Brain, 3-tier, spec.md,
  no-hallucination), plus the skills as reference docs.
- ⚠️ **Claude Code-specific:** the `scripts/` **hooks** (mechanical enforcement) and the `.claude/skills`
  auto-trigger + `.claude/agents` subagent mechanism. On other tools, the Process Gate and Lesson Loop
  become **strong standing rules** in your rules file (the nudge layer) rather than hard enforcement —
  still valuable, just not auto-blocking.

## Windows notes
- Hooks are bash scripts, so Git Bash or WSL must be available for Claude Code to invoke `bash …`.
- `python3` often doesn't exist on Windows — the hooks now auto-detect `python`, so they work either way.
- To run the graph tool by hand, use `python context/admin/obsidian_graph.py audit` (swap `python3`→`python`).

## Connections
- [[README]]
- [[CLAUDE]]
