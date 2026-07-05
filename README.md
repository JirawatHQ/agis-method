# Agis Method — starter kit สำหรับ Claude Code

**"วิธีการทำงาน" ของผู้ช่วย AI ส่วนตัวที่ใช้จริง — แพ็กเป็น template ให้ก็อปไปตั้งของตัวเองได้**

ไม่ใช่แอป ไม่ใช่ปลั๊กอิน — เป็น **ชุดกฎ + hooks + โครงสร้าง** ที่ทำให้ Claude Code:
- **มีวินัย** — ประกาศเจตนาก่อนลงมือทุกงาน (Process Gate) ไม่พุ่งทำมั่ว
- **เรียนรู้จากที่ผิด** — ทุก correction ต้องจบด้วย patch ถาวร (Lesson Loop)
- **ไม่เริ่มจากศูนย์** — ดึงจาก knowledge base/skill ที่มีก่อนเสมอ (Second Brain)
- **จัดระบบงานเป็นทีม** — Orchestrator → Team Lead (subagent) → Worker
- **จำได้ข้ามครั้ง** — ระบบ memory + wiki + daily note ที่เชื่อมกันเป็นกราฟเดียว

> ทั้งหมดนี้ **ไม่มีข้อมูลส่วนตัวของใครติดมา** — genericize แล้ว เอาขึ้น public ได้

---

## เริ่มใช้ (3 ขั้น)

```bash
# 1. clone เข้าโฟลเดอร์ที่จะเป็น "vault" ของคุณ
git clone <repo-url> my-assistant && cd my-assistant

# 2. รัน setup — จะถามชื่อผู้ช่วย/บทบาท/ภาษา แล้วเติมให้อัตโนมัติ
bash setup.sh

# 3. เปิด Claude Code ในโฟลเดอร์นี้ → hooks ทำงานเองทันที
claude
```

จากนั้นแก้ `{{...}}` ที่เหลือใน `CLAUDE.md` กับ `global-CLAUDE.template.md` ให้เข้ากับตัวเอง

## มีอะไรในกล่อง

| ส่วน | ไฟล์ | คืออะไร |
|------|------|---------|
| กฎหลัก | `CLAUDE.md` | เฟรมเวิร์กทั้งหมด (Process Gate, Lesson Loop, Second Brain, ...) |
| ตัวตน | `global-CLAUDE.template.md` | identity ของผู้ช่วย → ก็อปไป `~/.claude/CLAUDE.md` |
| กลไกบังคับ | `scripts/*.sh` + `.claude/settings.json` | hooks — process gate, lesson loop, graph hygiene |
| ทีม | `.claude/agents/` + `teams/` | โครง Orchestrator → Lead → Worker (มี `_TEMPLATE`) |
| ความรู้ | `context/wiki/` | knowledge base ที่ distill แล้ว (เริ่มเปล่า) |
| ความจำ | `context/memory/` + `MEMORY.md` | ระบบ memory + graph mirror |
| เครื่องมือ | `.claude/skills/` | **11 skills ทั่วไป** พร้อมใช้ (ดู `.claude/skills/README.md`) |
| graph | `context/admin/obsidian_graph.py` | รักษากราฟ Obsidian ไม่ให้ orphan/broken |

## ปรัชญาเบื้องหลัง
> **hook > text.** ข้อความเตือนใน CLAUDE.md เป็นแค่ nudge — LLM ข้ามได้ตลอด.
> การบังคับจริงคือ hook ที่รันทุกครั้ง. ทุกกฎสำคัญในนี้จึงมี hook หนุนหลัง

> **ยิ่งผิด ยิ่งเก่ง.** ระบบไม่ได้สมบูรณ์ตั้งแต่แรก — มันดีขึ้นเพราะทุกครั้งที่พลาด
> ถูกบันทึกและ patch ลงชั้นถาวร (Lesson Loop) ใช้ไปเรื่อยๆ มันจะรู้จักคุณมากขึ้น

## ปรับให้เป็นของคุณ
- **ทีม:** ลบทีมตัวอย่าง สร้างทีมตามชีวิตจริง (ก็อป `_TEMPLATE-lead.md`)
- **skills:** เก็บที่ใช้ ลบที่ไม่ใช้ เพิ่มใหม่ผ่าน Ingest Workflow (ดู `CLAUDE.md`)
- **hooks:** เปิด/ปิดใน `.claude/settings.json`

## เครดิต
Skills บางตัวกลั่น/รวบรวมมาจากงานสาธารณะของชุมชน — ดูที่มาใน `.claude/skills/README.md`

## Connections
- [[CLAUDE]]
- [[global-CLAUDE.template]]
