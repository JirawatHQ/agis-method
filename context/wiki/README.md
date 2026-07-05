# context/wiki/ — Knowledge Base

wiki สไตล์ Karpathy: กลั่นความรู้จาก rawdata/research เป็น markdown ที่อ่านซ้ำได้เร็ว
ไม่ต้อง re-process แหล่งดิบทุกครั้ง

## โครงต่อทีม
```
context/wiki/<team>/
  _schema.md      # สารบัญ: ไฟล์ไหนมีข้อมูลอะไร (Lead อ่านอันนี้ก่อน)
  <topic>.md      # ความรู้จริง — ปิดท้ายด้วย _อัปเดต: YYYY-MM-DD
```

## กติกา
1. Lead อ่าน `_schema.md` → รู้ว่ามีอะไร → อ่านเฉพาะที่เกี่ยว
2. มี rawdata ใหม่ → Worker distill → append ลง wiki (ไม่เขียนทับมั่ว)
3. ทุกไฟล์ .md ต้องมี `## Connections` (hook เติมให้)

---
## Connections
- [[CLAUDE]]
- [[context/wiki/_index]]
