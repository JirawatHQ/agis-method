**English** · [ภาษาไทย](#ภาษาไทย)

# Prompt for your AI assistant

Ready-to-paste prompts so **any** AI coding assistant can adopt this method for you — not only Claude.
Works with Claude Code, Cursor, Windsurf, Cline/Roo, Gemini CLI, Codex (AGENTS.md), Copilot, aider, etc.

---

## 1) Adopt / install prompt — let your AI set it up

Open your AI assistant in the project you want to upgrade, and paste:

```text
Read the repo https://github.com/JirawatHQ/agis-method (clone it if you can).
Help me adopt its "Agis Method" working framework into THIS project. Rules for you:

1. If this project ALREADY has a rules file (CLAUDE.md / AGENTS.md / .cursorrules / .clinerules /
   GEMINI.md / etc.) or existing hooks — MERGE, do not overwrite. Follow "Path B" in ADOPTING.md.
2. The portable core is the framework's RULES: Process Gate, Lesson Loop, Second Brain, 3-tier team,
   spec.md protocol, no-hallucination. Put these into the rules file MY tool auto-reads
   (see the tool→file table in ADOPTING.md). If unsure which file, ask me.
3. scripts/ holds the enforcement hooks. If my tool is Claude Code, wire them into
   .claude/settings.json (append to the hook arrays, don't replace). If my tool has no hook system,
   tell me clearly, and instead make the Process Gate + Lesson Loop STRONG standing rules in my rules file.
4. Hooks need bash + python and auto-detect `python3` or `python`. Warn me if my environment lacks either.
5. Before editing anything, show me a short plan: exactly which files you'll create/append and where.
   Do not overwrite any existing file without my confirmation.
```

## 2) System-prompt / rules version — for AIs that don't auto-read a rules file

If your tool has no project rules file, paste the **core rules** below (or the full `CLAUDE.md`) as the
AI's custom instructions / system prompt. Tool-agnostic:

```text
Operate by the "Agis Method":

1. PROCESS GATE — before any non-trivial task, state up front: (a) which role/team owns it,
   (b) what existing knowledge/skills already apply (don't start from scratch),
   (c) whether real research/ingest is needed (don't fake it — actually read the source),
   (d) how you'll split the work (sub-agents/steps for anything large). Then act.
2. LESSON LOOP — when I correct you, or you catch your own mistake/slowness/waste: log it
   (symptom + root cause) to a lessons ledger, AND patch it at a permanent layer
   (a rule / skill / hook / memory / knowledge doc). A lesson with no patch = the task is NOT done.
3. SECOND BRAIN — consult my existing notes/knowledge/skills FIRST, then add new research. Connect
   across domains rather than answering in isolation.
4. STRUCTURED DELEGATION — act as an orchestrator: route work to a focused role, which may delegate
   to a worker, then summarize back up to me.
5. SPEC — every code project keeps a spec.md (architecture / done / todo / current state). Read it
   before starting, update it after finishing. Never say "done" without updating it.
6. NO HALLUCINATION — read the real file/output before deciding. Never fabricate file contents,
   tool results, or citations.
7. MEMORY — record durable facts about me immediately (don't wait to be asked); keep an index.

Be concise. Report outcomes honestly — if something failed or was skipped, say so.
```

---

<a name="ภาษาไทย"></a>
# (ภาษาไทย) Prompt สำหรับ AI ของคุณ

Prompt พร้อม paste ให้ AI ตัวไหนก็ได้เอา method นี้ไปใช้ — ไม่จำกัดแค่ Claude
(Claude Code, Cursor, Windsurf, Cline, Gemini CLI, Codex, Copilot, aider ฯลฯ)

## 1) Prompt ติดตั้ง — ให้ AI เซ็ตให้เอง

เปิด AI ในโปรเจกต์ที่จะอัปเกรด แล้ว paste:

```text
อ่าน repo https://github.com/JirawatHQ/agis-method (clone มาได้ยิ่งดี)
ช่วยเอา framework "Agis Method" มาใช้กับโปรเจกต์นี้ กติกาของคุณ:

1. ถ้าโปรเจกต์นี้มีไฟล์กฎอยู่แล้ว (CLAUDE.md / AGENTS.md / .cursorrules / .clinerules / GEMINI.md ฯลฯ)
   หรือมี hooks อยู่แล้ว → ให้ MERGE ห้ามเขียนทับ ทำตาม "Path B" ใน ADOPTING.md
2. แกนที่พกไปได้คือ "กฎ": Process Gate, Lesson Loop, Second Brain, ทีม 3 ชั้น, spec.md, ห้าม hallucinate
   เอากฎพวกนี้ใส่ในไฟล์กฎที่ tool ของฉันอ่านเอง (ดูตาราง tool→ไฟล์ ใน ADOPTING.md) ถ้าไม่แน่ใจให้ถามฉัน
3. scripts/ คือ hooks บังคับ ถ้า tool ฉันคือ Claude Code ให้ต่อเข้า .claude/settings.json (append array อย่าทับ)
   ถ้า tool ฉันไม่มีระบบ hook ให้บอกตรงๆ แล้วเปลี่ยนเป็นเขียน Process Gate + Lesson Loop เป็นกฎเข้มในไฟล์กฎแทน
4. hooks ใช้ bash + python (เลือก python3/python ให้เอง) — ถ้าเครื่องฉันไม่มี ให้เตือน
5. ก่อนแก้ไฟล์ ให้โชว์แผนสั้นๆ ก่อนว่าจะสร้าง/ต่อไฟล์ไหนตรงไหน ห้ามทับไฟล์เดิมโดยไม่ถามฉัน
```

## 2) เวอร์ชัน system prompt — สำหรับ AI ที่ไม่อ่านไฟล์กฎอัตโนมัติ

ถ้า tool ไม่มีไฟล์กฎประจำโปรเจกต์ ให้ paste **core rules** ในกล่องภาษาอังกฤษข้อ 2 ข้างบน (หรือ `CLAUDE.md` เต็ม)
เป็น custom instructions / system prompt — เนื้อเป็นกลาง ใช้ได้ทุก AI

---
## Connections
- [[README]]
- [[ADOPTING]]
- [[CLAUDE]]
