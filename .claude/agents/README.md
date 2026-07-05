# .claude/agents/ — Team Leads (subagents)

ไฟล์ในนี้คือ **subagent จริง** ที่ Claude Code เรียกด้วย Agent tool (Tier 2 ของ 3-tier org)
แต่ละไฟล์ = 1 Team Lead. `frontmatter` (`name` + `description`) คือสิ่งที่ orchestrator ใช้
ตัดสินใจ route งานมาให้ — เขียน `description` ให้มี **trigger keyword ชัดๆ**

## สร้างทีมใหม่
1. ก็อป `_TEMPLATE-lead.md` → `<team>-lead.md` แก้ `name`, `description`, เนื้อหา
2. (ถ้าต้องการ worker) สร้าง `teams/<team>/lead.md` + `teams/<team>/worker_*.md`
3. อัปเดต routing ใน `CLAUDE.md` (หัวข้อ Organization) ให้ชี้มาทีมนี้

## ความสัมพันธ์กับ teams/
- `.claude/agents/<team>-lead.md` = **นิยาม subagent** (Claude Code โหลด)
- `teams/<team>/` = **เอกสารทีมแบบ browse ได้** (lead.md + worker docs) ใน Obsidian graph
ทั้งสองเสริมกัน — agent file สั้น เน้น routing; teams/ เก็บรายละเอียด role

## Connections
- [[CLAUDE]]
- [[teams/README]]
