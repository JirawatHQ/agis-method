#!/usr/bin/env bash
# UserPromptSubmit hook — inject "Process Gate" เฉพาะ prompt ที่เป็นคำสั่งงานจริง
# ข้าม: system message, slash command, prompt สั้น (ตอบรับ/คุยต่อ)
# ทำไมต้องเป็น hook: text เตือนใน CLAUDE.md เป็นแค่ nudge — hook คือการ "บังคับ" ให้เห็นทุก prompt
PY="$(command -v python3 || command -v python)"
[ -z "$PY" ] && exit 0   # ไม่มี python (เช่น Windows มีแต่ 'python') → ข้ามแบบไม่พังทั้ง session
PROMPT=$("$PY" -c "import json,sys; print(json.load(sys.stdin).get('prompt',''))" 2>/dev/null)

case "$PROMPT" in
  "<task-notification>"*|"<local-command"*|"Caveat:"*|/*) exit 0 ;;
esac

# prompt สั้นกว่า ~60 ไบต์ = ตอบรับ/สั่งต่อเนื่อง ("ทำต่อ", "โอเค ลุย") — gate เต็มไม่จำเป็น
[ "${#PROMPT}" -lt 60 ] && exit 0

cat <<'GATE'
[PROCESS GATE] ก่อนเริ่มงานที่ไม่ใช่ trivial — declare 4 ข้อนี้ให้ผู้ใช้เห็นก่อนลงมือ ห้ามข้าม:
1) ทีมเจ้าของงาน (route ผ่าน Team Lead → Worker)
2) ของเดิมที่มี (เช็ค skill/wiki/memory ก่อน ไม่เริ่มจากศูนย์)
3) ต้อง Ingest/research ไหม (ถ้าสั่ง "ไปหา/ศึกษา/ปรับใช้" = research แหล่งภายนอกจริง ห้ามเขียนจากความรู้ตัวเองแล้วอ้างว่า research)
4) แบ่ง subagent ยังไง (งานใหญ่/หลาย angle = spawn subagent ห้ามรวบทำคนเดียว)
GATE
