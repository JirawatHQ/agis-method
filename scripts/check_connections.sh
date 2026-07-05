#!/usr/bin/env bash
# PostToolUse hook (Write|Edit) — เติม "## Connections" ให้ไฟล์ .md ใหม่ใน project อัตโนมัติถ้ายังไม่มี
# จุดประสงค์: กัน orphan ใน Obsidian graph — ทุกไฟล์ต้องมีขอบเชื่อมอย่างน้อย 1 เส้น
# path ใช้ $CLAUDE_PROJECT_DIR (Claude Code ส่งให้) → พกพาได้ ไม่ต้อง hardcode
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | python3 -c "import json,sys; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)
ROOT="${CLAUDE_PROJECT_DIR:-$PWD}"

[[ "$FILE_PATH" != *.md ]] && exit 0
[[ "$FILE_PATH" != "$ROOT"/* ]] && exit 0
[ ! -f "$FILE_PATH" ] && exit 0
grep -q "^## Connections" "$FILE_PATH" && exit 0

RELATIVE="${FILE_PATH#"$ROOT"/}"

# --- เดา connections จาก path pattern (ปรับเพิ่ม case ได้ตามโครงของคุณ) ---
case "$RELATIVE" in
  context/wiki/*/*.md)
    TEAM=$(echo "$RELATIVE" | cut -d/ -f3)
    CONNECTIONS="- [[context/wiki/${TEAM}/_schema]]\n- [[teams/${TEAM}/lead]]" ;;
  teams/*/*.md)
    TEAM=$(echo "$RELATIVE" | cut -d/ -f2)
    CONNECTIONS="- [[CLAUDE]]\n- [[context/wiki/${TEAM}/_schema]]" ;;
  context/admin/daily-notes/*)
    [[ "$(basename "$FILE_PATH")" == *template* ]] && exit 0
    CONNECTIONS="- [[CLAUDE]]" ;;
  *)
    exit 0 ;;
esac

printf "\n---\n## Connections\n%b\n" "$CONNECTIONS" >> "$FILE_PATH"
python3 - "$RELATIVE" <<'PYEOF'
import json, sys
rel = sys.argv[1]
msg = (f"[GRAPH] hook เติม ## Connections ต่อท้าย {rel} อัตโนมัติแล้ว (เดาจาก path) — "
       "ถ้าจะแก้ไฟล์นี้ต่อให้ Read ใหม่ก่อน และถ้า links ไม่ตรงเนื้อหา ให้แก้เป็น [[link]] ที่ถูกต้อง")
print(json.dumps({"hookSpecificOutput": {"hookEventName": "PostToolUse", "additionalContext": msg}}, ensure_ascii=False))
PYEOF
