---
name: landing-page
description: >
  สร้าง landing page ที่ "แปลงผู้ชมเป็น action" ได้จริง ระดับ production เป็นไฟล์ HTML เดียวจบ
  (ไม่ต้อง build, deploy ที่ไหนก็ได้). ใช้เมื่อผู้ใช้ขอทำ landing page / หน้าการตลาด /
  หน้าเปิดตัวสินค้า / หน้าโปรไฟล์ครีเอเตอร์-portfolio / หรือขอปรับ conversion+SEO ของหน้าเดิม.
  สังเคราะห์จาก best practice ของ Shopify, Unbounce, CXL และ Claude skills บน GitHub.
---

# Landing Page — Playbook

> เป้าหมายเดียวของ landing page: พาผู้ชม → **action เดียว** (สมัคร / ซื้อ / จอง / ติดตาม)
> ทุกองค์ประกอบต้องรับใช้เป้านี้ ถ้าไม่ → ตัดทิ้ง

## 1. หลักการแปลง (5 เสา)
1. **Value Proposition** — ตอบ "ฉันได้อะไร" ภายใน 5 วินาทีแรก เห็นชัดเหนือ fold
2. **Cognitive Ease** — เข้าใจง่าย ไม่ต้องคิด: คำสั้น, ลำดับสายตาชัด, ที่ว่างพอ
3. **Reduce Friction** — ตัดทุกอย่างที่ทำให้ลังเล (ฟอร์มยาว, ทางเลือกเยอะ, โหลดช้า)
4. **Single Focus** — CTA หลัก "หนึ่งเดียว" เด่นสุดในหน้า เพิ่มเป้าหมายที่สอง = conversion ตกทั้งคู่
5. **Social Proof** — หลักฐานจริง (ยอด, รีวิว, โลโก้ลูกค้า, ผลงาน) คือ trust signal ที่แรงสุด

## 2. โครงสร้างหน้า (anatomy — เรียงตามการเลื่อน)
1. **Nav** — โลโก้ + CTA เดียว (อย่าใส่เมนูเยอะจนพาออกนอกหน้า)
2. **Hero** — headline เน้น benefit + subheadline + CTA หลัก + ภาพ/ของจริง
3. **Social proof bar** — ยอด/โลโก้/ดาว วางใกล้ hero เพื่อสร้างความเชื่อทันที
4. **Benefits / Features** — แปลง feature → benefit ("ทำอะไรได้" ไม่ใช่ "มีอะไร")
5. **How it works** — 3 ขั้นง่ายๆ ลดความกลัวว่ายาก
6. **Testimonials** — เสียงจริง พร้อมชื่อ-รูป-รายละเอียด (ยิ่งเจาะจงยิ่งน่าเชื่อ)
7. **FAQ** — ดักข้อโต้แย้งก่อนตัดสินใจ
8. **Final CTA** — ย้ำ action เดียวอีกครั้งตอนจบ
9. **Footer** — ลิงก์รอง, ติดต่อ, โซเชียล

> long-form OK: คนยอมเลื่อน ถ้าแต่ละ scroll เผยคุณค่า/หลักฐานใหม่ (narrative sequencing)

## 3. Copywriting frameworks
- **Headline = Specific Result Formula** — บอกผลลัพธ์ที่จับต้องได้ ไม่ใช่คำสวยลอยๆ
  - ❌ "เปลี่ยนชีวิตคุณ"  ✅ "ลดเวลาทำรายงานจาก 3 ชม. เหลือ 10 นาที"
- **PAS** — Problem → Agitate → Solution
- **AIDA** — Attention → Interest → Desire → Action
- **Benefit > Feature** — ทุก feature ต้องตามด้วย "แล้วยังไง/ได้อะไร"
- **Testimonial = STAR** — Situation → Task → Action → Result
- **Audience awareness** — ปรับ copy ตามระดับการรับรู้:
  - *Problem-aware* → ขยี้ปัญหาก่อน
  - *Solution-aware* → เทียบว่าทำไมวิธีเราดีกว่า
  - *Product-aware* → ดันข้อเสนอ/ราคา/CTA เลย

## 4. มาตรฐานเทคนิค (ต้องผ่านทุกข้อ)
- **ไฟล์เดียวจบ** — HTML + CSS (inline/Tailwind CDN) + JS เล็กน้อย, ไม่มี build step
- **Mobile-first** — 3 breakpoint (มือถือ/แท็บเล็ต/จอใหญ่); 60%+ ของทราฟฟิกมาจากมือถือ
- **Sticky mobile CTA** — ปุ่มหลักติดล่างจอบนมือถือ
- **A11y** — heading hierarchy (h1 เดียว), alt ทุกรูป, focus state, contrast ผ่าน WCAG
- **SEO** — title/description คำค้นต้นๆ, canonical, **OG + Twitter card**, **JSON-LD**
  (Person/Organization/Product/VideoObject ตามบริบท), `sitemap.xml`, `robots.txt`
- **Performance** — โหลด < 2 วินาที, lazy-load รูป, dependency น้อยสุด, ใช้รูป thumbnail จริง
- **OG image** — ภาพแนวนอน 1200×630 (อย่าใช้รูปจัตุรัส มันโดนครอป)

## 5. Workflow
**ทำใหม่:**
1. *Discovery* — ถาม: ทำเพื่ออะไร, กลุ่มเป้าหมาย, value prop, CTA, โทน/สี, ประเภทหน้า
2. *เลือกโครงสร้าง* ตามประเภท (SaaS / คอร์ส / สินค้า / อีเวนต์ / ครีเอเตอร์)
3. *เขียน copy* ด้วย framework ข้อ 3
4. *ออกแบบ* — ดู skill `frontend-design` (commit aesthetic เดียวให้คม)
   + อ่าน [references/design-principles.md](references/design-principles.md) — quick-ref layout/สี/font + UX Laws
   + เจาะลึกทฤษฎี [references/design-theory.md](references/design-theory.md) — 17 ศาสตร์ (Gestalt ครบชุด, Nielsen/Shneiderman/Norman, Laws of UX เต็ม, Cialdini+Fogg, Disney 12, Tufte, Atomic Design, Dieter Rams, color/type theory เชิงลึก)
5. *Optimize/QA* — ผ่าน checklist ข้อ 6

**ปรับหน้าเดิม:** ให้คะแนนตาม checklist (100) → จัดลำดับแก้ตาม impact (วิกฤต > สูง > กลาง)

## 6. QA Checklist (scorecard)
- [ ] Value prop ชัดเหนือ fold ใน 5 วิ
- [ ] CTA หลักเดียว เด่นสุด สีตัดจากที่อื่น
- [ ] มี social proof ที่มองเห็น
- [ ] headline เป็น specific result
- [ ] feature ถูกแปลงเป็น benefit
- [ ] responsive + sticky CTA บนมือถือ
- [ ] ฟอร์ม ≤ 4 ช่อง
- [ ] SEO (title/OG/JSON-LD/sitemap) ครบ
- [ ] โหลด < 2 วิ, รูป lazy
- [ ] a11y (contrast/alt/focus/heading) ผ่าน

## 7. Anti-patterns (ห้าม)
1. headline กว้างๆ ลอยๆ  2. เมนู/ลิงก์พาออกนอกหน้าเยอะ  3. รูป stock ปลอมๆ
4. ฟอร์ม > 4 ช่อง  5. ไม่มี social proof  6. ไม่มี CTA ติดล่างบนมือถือ
7. CTA หลายตัวแย่งกัน  8. กำแพงข้อความ  9. โหลดช้า  10. ฟอนต์ภาษาไม่คุม (เช่นเอาฟอนต์ฝรั่งครอบไทย)

## แหล่งอ้างอิง
- Shopify — High-Converting Landing Pages: Best Practices + Core Pillars
- Unbounce — Landing Page Best Practices / Examples
- CXL — How to Build a High-Converting Landing Page
- GitHub: jezweb/claude-skills (frontend/landing-page) — single-HTML generator
- GitHub: alexdcd/Mafia-Claude-Skills (landing-page-mastery) — copy frameworks, audit 100 pts, anti-patterns

---
## Connections
- [[CLAUDE]]
- [[README]]
