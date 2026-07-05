# scripts/ — Hooks (กลไกบังคับพฤติกรรม)

หัวใจของ "วิธีการทำงานที่ดี" คือ **hook** ไม่ใช่แค่ข้อความเตือนใน CLAUDE.md
เพราะ LLM อ่านกฎแล้ว "ข้าม" ได้ตลอด — hook คือการบังคับเชิงกลที่ทำงานทุกครั้งจริง

| hook | event | ทำอะไร |
|------|-------|--------|
| `process_gate.sh` | UserPromptSubmit | ฉีด Process Gate 4 ข้อ ก่อนทุกงานที่ไม่ trivial (บังคับ declare เจตนาก่อนลงมือ) |
| `lesson_hint.sh` | UserPromptSubmit | ตรวจว่าผู้ใช้กำลัง "ตำหนิ/แก้งาน" → เตือนให้ปิดวงจร Lesson Loop |
| `check_connections.sh` | PostToolUse (Write\|Edit) | เติม `## Connections` ให้ไฟล์ .md ใหม่ กัน orphan ใน Obsidian graph |

## ทำงานยังไง
ทั้งหมดถูก wire ไว้ใน `../.claude/settings.json` ด้วย path `$CLAUDE_PROJECT_DIR/scripts/...`
→ เปิด Claude Code ในโฟลเดอร์ project นี้ hooks ทำงานเองทันที **ไม่ต้องแก้ path**

## ปรับแต่ง
- ไม่อยากได้ Process Gate → ลบ block `process_gate.sh` ออกจาก settings.json
- อยากเพิ่มเงื่อนไข routing ใน `check_connections.sh` → เพิ่ม `case` ตามโครง path ของคุณ
- ทุก hook เขียนด้วย bash + python3 (มากับ macOS/Linux อยู่แล้ว) แก้ได้อิสระ

## Connections
- [[CLAUDE]]
- [[README]]
