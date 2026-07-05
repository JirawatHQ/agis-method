# .claude/skills/ — Skills ทั่วไป (11 ตัว)

skill = ความสามารถเฉพาะทางที่ Claude เรียกอัตโนมัติเมื่อ trigger เข้าเงื่อนไข
ชุดนี้คัดเฉพาะ **domain-general** (ใช้ได้กับทุกคน) — เก็บที่ใช้ ลบที่ไม่ใช้ได้

| skill | ใช้ตอนไหน |
|-------|-----------|
| `writing-great-skills` | เขียน/แก้ SKILL.md ให้ดี — อันนี้คือ meta ของการทำ skill ใหม่ |
| `browser-automation` | scrape เว็บ JS/SPA, login, กรอกฟอร์ม (Playwright) |
| `storm-research` | วิจัยหลายมุมมอง (5 persona) สำหรับการตัดสินใจ/ประเด็นถกเถียง |
| `gas-automation` | เชื่อม Google Apps Script — automate Sheets/Gmail/Calendar/Drive |
| `landing-page` | ทำ landing page / หน้าการตลาด (HTML เดียวจบ) |
| `file-organizer` | จัดระเบียบไฟล์/โฟลเดอร์ หา duplicate เสนอโครงสร้าง |
| `karpathy-guidelines` | guideline ลดความพลาดตอนเขียน/refactor โค้ด |
| `scrutinize` | รีวิว plan/PR/diff แบบ outsider (ตั้งคำถามเจตนา + ไล่ code path) |
| `grilling` | สัมภาษณ์เค้น stress-test แผน/ดีไซน์ก่อนลงมือ |
| `handoff` | ส่งต่อ context ระหว่าง session/คน (manual) |
| `teach` | อธิบาย/สอนแนวคิดให้เข้าใจ (manual) |

## เพิ่ม skill ใหม่
ทำผ่าน Ingest Workflow ใน `CLAUDE.md` (ดูด→กลั่น→เก็บ) หรือใช้ skill `writing-great-skills` เป็นไกด์

## เครดิต / ที่มา
Skills หลายตัวกลั่น/ปรับจากงานสาธารณะของชุมชน Claude Code (เช่น meta-skills แนว
grilling/handoff/teach/scrutinize/writing-great-skills, และ file-organizer) — เครดิตเป็นของผู้เขียนต้นทาง
ตัวที่ distill เองจาก research (browser-automation, storm-research, gas-automation) อ้างอิงแหล่งไว้ในไฟล์
ใช้/แจกจ่ายต่อโปรดคงเครดิตต้นทาง

## Connections
- [[CLAUDE]]
- [[README]]
