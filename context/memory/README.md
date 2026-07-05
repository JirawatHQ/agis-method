# context/memory/ — ระบบความจำ

## memory อยู่ที่ไหน
Claude Code เก็บ memory จริงไว้ **นอก vault** ที่:
```
~/.claude/projects/<vault-path-แทน / ด้วย ->/memory/
# เช่น vault = /Users/me/assistant  →  ~/.claude/projects/-Users-me-assistant/memory/
```
โฟลเดอร์ `context/memory/` (ตรงนี้) เก็บแค่ **mirror stub** ที่ auto-generate เพื่อให้
`[[wikilink]]` ใน Obsidian resolve ได้ — **ห้ามแก้มือ** แก้ที่ต้นทางแล้ว sync

## รูปแบบ 1 memory = 1 ไฟล์
```markdown
---
name: <short-kebab-case-slug>
description: <สรุป 1 บรรทัด — ใช้ตัดสินความเกี่ยวข้องตอน recall>
metadata:
  type: user | feedback | project | reference
---
<เนื้อ fact; feedback/project ตามด้วย **Why:** และ **How to apply:**>
```
type: `user` (ผู้ใช้เป็นใคร) · `feedback` (กติกาการทำงาน) · `project` (งานที่ทำอยู่) · `reference` (ลิงก์/แหล่ง)

## workflow
1. เจอข้อมูลใหม่เกี่ยวผู้ใช้ → เขียนไฟล์ memory ทันที (ไม่รอถาม)
2. เพิ่ม 1 บรรทัดใน `MEMORY.md`
3. รัน `python3 context/admin/obsidian_graph.py sync` → regen mirror ตรงนี้
4. เช็คก่อนสร้างซ้ำ: มีไฟล์ที่ครอบเรื่องนี้แล้วไหม → อัปเดตอันเดิมแทน

## Connections
- [[MEMORY]]
- [[CLAUDE]]
