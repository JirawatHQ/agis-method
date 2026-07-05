#!/usr/bin/env bash
# setup.sh — เติม identity ให้ Agis Method starter kit แล้วเปิด hooks ให้พร้อมใช้
# รันครั้งเดียวหลัง clone: bash setup.sh
set -e
KIT="$(cd "$(dirname "$0")" && pwd)"
echo "== Agis Method — setup =="
echo "(กด Enter เพื่อใช้ค่าดีฟอลต์ในวงเล็บ)"
echo

read -r -p "ชื่อผู้ช่วย [Aria]: " ASSISTANT_NAME; ASSISTANT_NAME="${ASSISTANT_NAME:-Aria}"
read -r -p "ชื่อคุณ (เจ้าของ) [ผู้ใช้]: " YOUR_NAME; YOUR_NAME="${YOUR_NAME:-ผู้ใช้}"
read -r -p "บทบาท/อาชีพของคุณ [ผู้ใช้ทั่วไป]: " YOUR_ROLE; YOUR_ROLE="${YOUR_ROLE:-ผู้ใช้ทั่วไป}"
read -r -p "ภาษาที่ให้ผู้ช่วยตอบ [ไทย]: " LANGUAGE; LANGUAGE="${LANGUAGE:-ไทย}"

python3 - "$KIT" "$ASSISTANT_NAME" "$YOUR_NAME" "$YOUR_ROLE" "$LANGUAGE" <<'PY'
import os, sys
kit, aname, yname, yrole, lang = sys.argv[1:6]
repl = {
    "{{ASSISTANT_NAME}}": aname,
    "{{YOUR_NAME}}": yname,
    "{{YOUR_ROLE}}": yrole,
    "{{YOUR_ROLE_ONE_LINER}}": yrole,
    "{{LANGUAGE}}": lang,
}
# แก้เฉพาะไฟล์ identity หลัก — ไม่แตะ _TEMPLATE (placeholder ทีมต้องเหลือไว้)
targets = ["CLAUDE.md", "global-CLAUDE.template.md"]
n = 0
for t in targets:
    p = os.path.join(kit, t)
    if not os.path.exists(p):
        continue
    s = open(p, encoding="utf-8").read()
    for k, v in repl.items():
        s = s.replace(k, v)
    open(p, "w", encoding="utf-8").write(s)
    n += 1
print(f"  เติม identity ใน {n} ไฟล์แล้ว")
PY

chmod +x "$KIT"/scripts/*.sh 2>/dev/null || true

echo
echo "== เสร็จ =="
echo "1) ตัวตนผู้ช่วย (global): ก็อป global-CLAUDE.template.md ไปเป็น ~/.claude/CLAUDE.md"
echo "     ⚠ ถ้ามี ~/.claude/CLAUDE.md อยู่แล้ว ให้ merge เอง อย่าเขียนทับ"
echo "     รีวิวก่อน:  cat \"$KIT/global-CLAUDE.template.md\""
echo "2) เปิด Claude Code ในโฟลเดอร์นี้:  claude"
echo "     hooks (process gate / lesson loop / graph) ทำงานเองผ่าน .claude/settings.json"
echo "3) แก้ {{...}} ที่เหลือใน CLAUDE.md ให้ครบ แล้วเริ่มสร้างทีมของคุณ (teams/_TEMPLATE-lead.md)"
