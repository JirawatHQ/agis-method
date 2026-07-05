#!/bin/bash
# UserPromptSubmit hook — จับสัญญาณว่าผู้ใช้กำลัง "correct" งาน → เตือนให้ปิดวงจร Lesson Loop
# (บันทึก lessons.md + patch ชั้นที่เกี่ยว) — nudge 1 บรรทัด ราคาถูก แต่กันลืมได้จริง
PROMPT=$(python3 -c "import json,sys; print(json.load(sys.stdin).get('prompt',''))" 2>/dev/null)

case "$PROMPT" in
  "<task-notification>"*|"<local-command"*|"Caveat:"*|/*) exit 0 ;;
esac

# pattern ที่เป็นการตำหนิ/แก้งานจริง (เลี่ยงคำโดดที่ชนศัพท์อื่น)
if printf '%s' "$PROMPT" | grep -qE 'ทำผิด|ผิดพลาด|พลาดไป|แก้ใหม่|ทำใหม่|ไม่ใช่แบบนี้|ไม่ถูกต้อง|อย่าทำแบบ|ทำไมไม่ทำ|ทำไมถึงไม่|บอกแล้วว่า|ยังไม่ตรง|ไม่ตรงกับที่สั่ง|ลืมทำ|ตกหล่น'; then
  printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":"[LESSON LOOP] ผู้ใช้กำลัง correct งาน — หลังแก้เสร็จ ต้องปิดวงจร: (1) บันทึกอาการ+root cause ลง context/admin/lessons.md (2) patch ชั้นที่เกี่ยวอย่างน้อย 1 ชั้น (hook/skill/CLAUDE/memory/wiki) ตามบันไดใน CLAUDE.md — lesson ที่ไม่มี patch = ยัง open ห้ามถือว่างานจบ"}}'
fi
exit 0
