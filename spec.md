# spec.md — Agis Method starter kit

> ตัวอย่าง spec.md ตาม protocol ใน CLAUDE.md — ทุก project ที่มีโค้ดควรมีไฟล์แบบนี้ใน root
> (vault ที่ไม่ใช่ project โค้ด ใช้ spec.md เป็น system doc ของผู้ช่วยเองก็ได้)

## Architecture
- **CLAUDE.md** — กฎ project-level (Process Gate, Lesson Loop, Second Brain, ...)
- **global-CLAUDE.template.md** — ตัวตนผู้ช่วย → `~/.claude/CLAUDE.md`
- **scripts/ + .claude/settings.json** — hooks (บังคับพฤติกรรมเชิงกล)
- **.claude/agents/ + teams/** — 3-tier org (Orchestrator → Lead → Worker)
- **.claude/skills/** — เครื่องมือเฉพาะทาง (auto-trigger)
- **context/{wiki,memory,admin}/** — ความรู้ + ความจำ + running log, เชื่อมเป็น Obsidian graph เดียว

## Data Contracts
- hook อ่าน stdin เป็น JSON (`prompt` / `tool_input.file_path`), path ผ่าน `$CLAUDE_PROJECT_DIR`
- memory: 1 fact/ไฟล์ + frontmatter (`name`/`description`/`type`) + บรรทัดใน `MEMORY.md`
- graph tool: `obsidian_graph.py {audit|sync|fix-orphans|heal-links|all}`, path ตั้งผ่าน env `AGIS_VAULT`/`AGIS_MEM_DIR`

## Done
- แพ็ก framework + 11 domain-general skills เป็น template สาธารณะ (genericize, ไม่มี PII)
- hooks พกพาได้ด้วย `$CLAUDE_PROJECT_DIR` — clone แล้วรันได้ไม่ต้องแก้ path

## Todo
- ผู้ใช้เติม `{{...}}` (ชื่อ/บทบาท/ภาษา) ผ่าน `setup.sh`
- สร้างทีมจริงตามชีวิตผู้ใช้ (ก็อป `_TEMPLATE`)
- Ingest ความรู้/skill เพิ่มตามการใช้งาน

## Current State
Template พร้อม distribute — รอผู้ใช้ปรับ identity + สร้างทีม/ความรู้ของตัวเอง

---
## Connections
- [[CLAUDE]]
- [[README]]
