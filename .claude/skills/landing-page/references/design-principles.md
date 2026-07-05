# Design Principles — Layout · สี · Font · ศาสตร์ที่เกี่ยวข้อง

> reference สำหรับ skill `landing-page` — หลักการออกแบบที่นำไปปรับใช้ได้จริง
> สังเคราะห์จาก: Laws of UX (Jon Yablonski), NN/g, LogRocket, UXness ฯลฯ (ดู sources ท้ายไฟล์)

## 1. การจัดเรียง / Layout
- **Visual Hierarchy** — จัดลำดับความสำคัญด้วย ขนาด / น้ำหนัก / สี / ตำแหน่ง / ที่ว่าง ให้ตาไหลไปจุดสำคัญก่อน
- **Whitespace (negative space)** — ที่ว่างไม่ใช่ที่เสีย มันสร้างโฟกัสและความหรู; กล้าเว้นเยอะ
- **Proximity** — จัดของที่เกี่ยวกันให้ใกล้กัน แยกกลุ่มที่ไม่เกี่ยวด้วยระยะห่าง
- **Alignment** — ทุกอย่างต้องมีเส้นจัดวางร่วมกัน (grid); ขอบที่ตรงกัน = ดูเป็นระเบียบ
- **Grid + 8-point system** — ใช้ระยะเป็นทวีคูณของ 8 (8/16/24/32...) ให้ spacing สม่ำเสมอทั้งหน้า
- **F-pattern / Z-pattern** — สายตาคนอ่านเว็บกวาดเป็นตัว F (เนื้อหายาว) หรือ Z (หน้า hero) → วางหัวข้อ/CTA ตามเส้นนี้
- **Rule of thirds / Focal point** — วางจุดเด่นไม่ให้อยู่กลางเป๊ะเสมอไป; มี 1 focal point ชัดต่อ section
- **Balance** — สมมาตร (ทางการ/นิ่ง) vs อสมมาตร (พลวัต/น่าสนใจ) เลือกให้ตรงคาแร็กเตอร์

## 2. สี / Color
- **กฎ 60-30-10** — สีหลัก 60% (พื้น/นิวทรัล) · สีรอง 30% · สีเน้น 10% (CTA, ไฮไลต์)
  → สีเน้นต้อง "ไม่ปรากฏที่อื่น" จะได้ดึงสายตาไปที่ action
- **Color harmony** (จากวงล้อสี):
  - *Analogous* — สีติดกัน → กลมกลืน อบอุ่น
  - *Complementary* — สีตรงข้าม → คอนทราสต์สูง สะดุดตา (ใช้กับ CTA)
  - *Triadic* — 3 สีห่าง 120° → สดใส สมดุล
- **Contrast & WCAG** — ตัวอักษรปกติ contrast ≥ 4.5:1, ตัวใหญ่ ≥ 3:1 (เช็คด้วย contrast checker)
- **Color psychology** — สีสื่ออารมณ์/แบรนด์ (แดง=เร่งด่วน/รัก, น้ำเงิน=เชื่อถือ, เขียว=เติบโต, ทอง/ไวน์=หรู-วินเทจ)
- **จำกัดพาเลต** — ใช้ CSS variables คุมสีกลาง 4-6 สี อย่ามั่ว

## 3. ตัวอักษร / Typography
- **Type scale (modular scale)** — ไล่ขนาดด้วยอัตราส่วนคงที่ เช่น 1.25 (major third) หรือ 1.618 (golden) → ลำดับชั้นกลมกลืน
- **Font pairing** — ใช้ 2-3 ฟอนต์พอ: 1 display (มีคาแร็กเตอร์) + 1 body (อ่านง่าย); คู่ที่คอนทราสต์กัน (serif+sans) ดูดี
- **Line length** — 45-75 ตัวอักษรต่อบรรทัด (อ่านสบายสุด); กว้างไป/แคบไปอ่านล้า
- **Line height** — body ~1.4-1.7, หัวข้อใหญ่ ~1.0-1.2
- **Hierarchy** — แยก h1/h2/body ด้วยขนาด+น้ำหนัก+สีให้ต่างชัด
- **ภาษาไทย (สำคัญ!)** — เลือกฟอนต์ที่มี glyph ไทยครบ (Sarabun, Trirong, Mitr, IBM Plex Sans Thai...);
  **ห้ามเอาฟอนต์ละติน (เช่น Cormorant, Playfair) ไปครอบข้อความไทย** เพราะไทยจะ fallback เป็นฟอนต์ระบบมั่ว
  → แยก class: ฟอนต์ละตินใช้กับตัวฝรั่งเท่านั้น, ไทยใช้ฟอนต์ไทย
- เลี่ยงฟอนต์เกลื่อน (Inter/Roboto/Arial) ถ้าต้องการคาแร็กเตอร์

## 4. ศาสตร์ที่เกี่ยวข้อง (UX Laws & หลักจิตวิทยา)
**Gestalt Principles** (สมองจัดกลุ่มสิ่งที่เห็นเป็นก้อน):
- *Proximity* — ใกล้กัน = เป็นกลุ่มเดียว
- *Similarity* — หน้าตาเหมือนกัน = พวกเดียวกัน
- *Closure* — สมองเติมส่วนที่ขาดเอง
- *Continuity* — ตาไหลตามเส้น/แนวต่อเนื่อง
- *Figure-Ground* — แยกวัตถุออกจากพื้น (ใช้สร้างโฟกัส)
- *Common Region* — ของในกรอบ/พื้นเดียวกัน = กลุ่มเดียว

**Laws of UX (Jon Yablonski):**
- **Hick's Law** — ตัวเลือกยิ่งเยอะ ยิ่งตัดสินใจช้า → ลดตัวเลือก, ใช้ progressive disclosure, CTA เดียว
- **Fitts's Law** — เป้าหมาย (ปุ่ม) ใหญ่และอยู่ใกล้ → กดง่ายเร็ว; ปุ่มสำคัญทำให้ใหญ่
- **Miller's Law** — คนจำได้ ~7±2 อย่างพร้อมกัน → จัดกลุ่มข้อมูล (chunking)
- **Jakob's Law** — คนคาดหวังให้เว็บเราทำงานเหมือนเว็บอื่นที่เขาคุ้น → อย่าฝืน convention
- **Von Restorff (Isolation Effect)** — ของที่ "ต่าง" จากพวก จะถูกจำ → ทำ CTA ให้โดดเด่นต่างจากทุกอย่าง
- **Aesthetic-Usability Effect** — ของสวย คนรู้สึกว่าใช้ง่ายกว่า (และให้อภัยข้อผิดพลาดมากกว่า)
- **Serial Position Effect** — คนจำตัวแรกและตัวสุดท้ายได้ดีสุด → วางของสำคัญหัว-ท้าย
- **Law of Proximity / Common Region** — (ตรงกับ Gestalt) ใช้ระยะ+กรอบจัดกลุ่ม

**CRAP (หลักจัดหน้าเบื้องต้น):**
- **C**ontrast (ต่างให้ชัด) · **R**epetition (ซ้ำให้เป็นระบบ) · **A**lignment (จัดแนว) · **P**roximity (จัดกลุ่ม)

**อื่นๆ:** Golden ratio (1.618) ใช้กับสัดส่วน layout/type · Aesthetic-Usability ย้ำว่างานดีไซน์ดีมีผลต่อ conversion จริง

## 5. Accessibility (a11y)
- contrast ผ่าน WCAG (4.5:1 / 3:1)
- `:focus-visible` ชัดเจน (คนใช้คีย์บอร์ด)
- alt ทุกรูป, heading hierarchy ถูกต้อง, semantic HTML
- ขนาดแตะบนมือถือ ≥ 44×44px (Fitts's Law + WCAG)

## วิธีนำไปใช้ (เช็คเร็ว)
1. มี focal point + CTA เดียวเด่นต่อ section ไหม (Hick + Von Restorff)
2. สีเป็นไปตาม 60-30-10 ไหม, CTA เป็นสี accert ที่ไม่ซ้ำที่อื่นไหม
3. spacing เป็นระบบ 8pt ไหม, ของที่เกี่ยวกันอยู่ใกล้กันไหม (Proximity)
4. ฟอนต์ ≤ 3 แบบ, type scale สม่ำเสมอ, ไทยใช้ฟอนต์ไทย ไหม
5. contrast/focus/alt ผ่าน a11y ไหม

## Sources
- Laws of UX — Jon Yablonski: https://lawsofux.com
- NN/g — Using Color to Enhance Your Design: https://www.nngroup.com/articles/color-enhance-design/
- LogRocket — 60-30-10 rule: https://blog.logrocket.com/ux-design/60-30-10-rule/
- LogRocket — Cognitive principles for UX: https://blog.logrocket.com/ux-design/cognitive-principles-for-ux-designers/
- UXness — Laws of UX: https://www.uxness.in/2024/03/12-laws-of-ux-designing-with-principles.html
- UX Design Institute — Laws of UX: https://www.uxdesigninstitute.com/blog/laws-of-ux/
- WPMayor — 60/30/10 in web design: https://wpmayor.com/the-60-30-10-rule-made-our-website-designs-infinitely-better/
