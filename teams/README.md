# teams/ — โครงข่ายทีมงาน (Team Network)

โฟลเดอร์นี้เก็บ **ลำดับชั้นองค์กร** ของผู้ช่วย (เอกสารแบบ browse ได้ คู่กับ subagent ใน `.claude/agents/`)

## Hierarchy
1. **Tier 1:** {{ASSISTANT_NAME}} (`../CLAUDE.md`) — Orchestrator
2. **Tier 2:** Team Leads (`teams/<team>/lead.md` + `.claude/agents/<team>-lead.md`) — หัวหน้าโดเมน
3. **Tier 3:** Workers (`teams/<team>/worker_*.md`) — ผู้เชี่ยวชาญเฉพาะทาง

## วิธีเพิ่มทีม/worker
- ทีมใหม่: ก็อป `_TEMPLATE-lead.md` → `teams/<team>/lead.md` + สร้าง subagent `.claude/agents/<team>-lead.md`
- worker ใหม่: ก็อป `_TEMPLATE-worker.md` → `teams/<team>/worker_<role>.md` แล้วให้ lead delegate มาหา

## ทีมที่แนะนำให้เริ่ม (ปรับตามชีวิตคุณ)
- **idea** — จัดโครงความคิดก่อนส่งต่อทีมอื่น
- **research** — วิจัยเชิงลึก สังเคราะห์หลักฐาน
- **taskmaster** — ติดตามงานค้าง unblock
- + ทีม **โดเมนงานหลักของคุณ** 2-4 ทีม (เช่น dev, business, study, ...)

---
## Connections
- [[CLAUDE]]
- [[README]]
