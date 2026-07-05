# Design Theory — ทฤษฎีการออกแบบฉบับสมบูรณ์

> "เล่มทฤษฎี" สำหรับ skill `landing-page` — รวมศาสตร์การออกแบบที่ถูกหลัก เน้นแน่นเชิงทฤษฎี
> ใช้คู่กับ [design-principles.md](design-principles.md) (ฉบับปฏิบัติ/quick-ref)
> Sources อยู่ท้ายไฟล์

---

## 1. องค์ประกอบ & หลักการออกแบบคลาสสิก (Elements & Principles)
**Elements (วัตถุดิบ):** เส้น (line) · รูปร่าง (shape) · รูปทรง/ปริมาตร (form) · พื้นที่ (space) · สี (color) · พื้นผิว (texture) · น้ำหนัก/ความเข้ม (value) · ตัวอักษร (type)

**Principles (วิธีจัดวัตถุดิบ):**
- **Balance** — สมดุล: สมมาตร / อสมมาตร / รัศมี (radial)
- **Contrast** — ความต่าง (ขนาด/สี/รูปร่าง/ทิศทาง) สร้างความน่าสนใจและลำดับ
- **Emphasis / Hierarchy** — จุดเด่น + ลำดับความสำคัญ
- **Movement** — นำสายตาไปตามเส้นทาง
- **Rhythm / Repetition / Pattern** — จังหวะซ้ำสร้างความเป็นระบบ
- **Proportion / Scale** — สัดส่วน/ขนาดสัมพัทธ์
- **Unity / Harmony** — เอกภาพ ทุกอย่างดูเป็นชุดเดียว
- **Variety** — ความหลากหลายกันเบื่อ (ตรงข้าม unity ต้องบาลานซ์)
- **Alignment · Proximity · Whitespace** — จัดแนว/จัดกลุ่ม/เว้นที่ว่าง

## 2. Gestalt Psychology (ครบชุด)
สมองจัดสิ่งเร้าเป็น "ก้อน" อัตโนมัติ:
- **Prägnanz (Law of Simplicity)** — สมองตีความให้ "ง่าย/เรียบ" ที่สุดเสมอ (กฎแม่ของ Gestalt)
- **Proximity** — ใกล้กัน = กลุ่มเดียว
- **Similarity** — เหมือนกัน = พวกเดียวกัน
- **Continuity** — ตาไหลตามเส้น/แนวต่อเนื่อง
- **Closure** — สมองเติมช่องว่างให้ครบรูป
- **Figure-Ground** — แยกวัตถุ (figure) ออกจากพื้น (ground)
- **Common Fate** — สิ่งที่เคลื่อนไปทางเดียวกัน = กลุ่มเดียว
- **Common Region** — อยู่ในกรอบ/พื้นเดียวกัน = กลุ่มเดียว
- **Symmetry · Focal Point · Uniform Connectedness · Past Experience**

## 3. Grid & Composition Theory
- **Swiss / International Typographic Style** — Müller-Brockmann: grid คือกระดูกสันหลังของการจัดหน้า
- **ชนิด grid** — manuscript / column / modular / baseline / hierarchical
- **Baseline grid + Vertical rhythm** — บรรทัดทุกคอลัมน์ล็อกกับเส้นฐานเดียวกัน
- **Rule of Thirds** — แบ่ง 3×3 วางจุดเด่นที่เส้น/จุดตัด
- **Gutenberg Diagram** — สายตาเริ่มซ้ายบน (primary optical area) → จบขวาล่าง (terminal area) สำหรับเลย์เอาต์ข้อความสม่ำเสมอ
- **Golden Ratio (1.618) / Fibonacci** — สัดส่วนที่ตางาม ใช้กับ layout & type scale
- **Dynamic Symmetry / Rabatment / Van de Graaf canon / Modulor (Le Corbusier)** — ระบบสัดส่วนคลาสสิก

## 4. Color Theory (เชิงลึก)
- **Color models** — RGB/HEX (จอ), CMYK (พิมพ์), HSL/HSV (ปรับง่าย), LAB (perceptual)
- **Itten's 7 Contrasts** — hue, light-dark, cold-warm, complementary, simultaneous, saturation, extension
- **Harmony schemes** — monochromatic / analogous / complementary / split-complementary / triadic / tetradic
- **Simultaneous & Successive Contrast** — สีถูกบิดการรับรู้โดยสีข้างเคียง
- **Color Temperature** — อุ่น (เด่น/เข้าหา) vs เย็น (ถอย/สงบ)
- **Color Psychology** — สื่ออารมณ์/วัฒนธรรม (ขึ้นกับ context)
- **60-30-10** — สัดส่วนพาเลต หลัก/รอง/เน้น
- **Accessibility** — contrast WCAG + เผื่อ color blindness (อย่าสื่อด้วยสีอย่างเดียว)

## 5. Typography Theory (เชิงลึก)
- **Type anatomy** — baseline, x-height, ascender/descender, counter, serif, stem
- **Vox-ATypI classification** — humanist/garalde/transitional/didone/slab/sans/script/display
- **Spacing** — kerning (คู่อักษร) · tracking (ทั้งคำ) · leading (ระยะบรรทัด)
- **Measure** — ความยาวบรรทัด 45-75 ตัวอักษร
- **Vertical rhythm / Baseline grid** — line-height เป็นระบบ
- **Readability vs Legibility** — อ่านรู้เรื่อง vs แยกตัวอักษรออก
- **Type scale (modular)** — ratio คงที่ (1.2 / 1.25 / 1.333 / 1.618)
- **Typographic color** — ความเข้ม-จางของบล็อกข้อความเมื่อหรี่ตามอง
- **Microtypography & OpenType** — ligatures, oldstyle figures, kerning pairs
- **ภาษาไทย** — เลือกฟอนต์ที่มี glyph ครบ; ระวังสระบน-ล่าง/วรรณยุกต์ชนกัน; อย่าใช้ฟอนต์ละตินครอบไทย

## 6. Visual Perception & Cognition
- **Preattentive Processing** — สมองจับ สี/ขนาด/ทิศทาง/การเคลื่อนไหว ได้ <250ms ก่อนตั้งใจมอง → ใช้สร้าง "pop-out"
- **Visual Weight** — ของใหญ่/เข้ม/สีสด/แปลก = หนัก ดึงสายตา
- **Optical Adjustments** — overshoot (วงกลม/สามเหลี่ยมต้องล้นเส้นนิดถึงดู "เท่า"), overhang
- **Cognitive Load Theory** — intrinsic / extraneous (ลดอันนี้!) / germane; working memory จำกัด
- **Miller's Law (7±2)** — chunking ข้อมูลเป็นกลุ่ม
- **Recognition over Recall** — ให้เห็นตัวเลือก ดีกว่าให้นึกเอง
- **Dual Coding** — ภาพ+คำคู่กันจำดีกว่า

## 7. Usability Heuristics & Interaction
**Nielsen's 10 Heuristics:** (1) visibility of system status (2) match real world (3) user control & freedom (4) consistency & standards (5) error prevention (6) recognition not recall (7) flexibility & efficiency (8) aesthetic & minimalist design (9) help recognize/recover errors (10) help & documentation

**Shneiderman's 8 Golden Rules:** consistency · shortcuts สำหรับ power user · informative feedback · ออกแบบ dialog ให้จบเป็นชุด · ป้องกัน error & ย้อนกลับได้ · ให้ผู้ใช้รู้สึกคุมได้ · ลดภาระความจำระยะสั้น · (รวม) reversible actions

**Norman's Principles (Design of Everyday Things):**
- **Affordance** — สิ่งของบอกว่า "ทำอะไรได้" (ปุ่มกดได้)
- **Signifier** — สัญญาณบอกว่า "ทำตรงไหน/อย่างไร"
- **Mapping** — ความสัมพันธ์ตัวควบคุม↔ผล (ตรงไปตรงมา)
- **Feedback** — ตอบสนองทันทีหลัง action
- **Constraints** — จำกัดไม่ให้ทำผิด
- **Conceptual Model · Discoverability**
- **Gulf of Execution / Evaluation** — ช่องว่างระหว่าง "ตั้งใจทำ↔รู้วิธี" และ "เห็นผล↔เข้าใจผล"

## 8. Laws of UX (ครบชุด — Jon Yablonski)
- **Fitts's Law** — เป้าใหญ่+ใกล้ = กดเร็ว
- **Hick's Law** — ตัวเลือกเยอะ = ช้า (ลด/จัดกลุ่ม)
- **Miller's Law** — 7±2 (chunking)
- **Jakob's Law** — คนคุ้น convention เว็บอื่น อย่าฝืน
- **Tesler's Law (Conservation of Complexity)** — ความซับซ้อนมีขั้นต่ำ ใครรับ? ระบบควรรับแทนผู้ใช้
- **Postel's Law (Robustness)** — รับ input หลากหลาย ส่ง output เคร่งครัด
- **Peak-End Rule** — คนจำ "จุดพีค" + "ตอนจบ" ของประสบการณ์
- **Zeigarnik Effect** — งานค้างถูกจำได้มากกว่า (progress bar, ขั้นที่ยังไม่จบ)
- **Doherty Threshold** — ระบบตอบ <400ms คนจะลื่นไหล/ทำงานต่อเนื่อง
- **Goal-Gradient Effect** — ยิ่งใกล้เป้า ยิ่งเร่ง (progress, แต้มสะสม)
- **Serial Position Effect** — จำหัว-ท้ายได้ดี
- **Von Restorff (Isolation)** — ของที่ต่างถูกจำ (ทำ CTA ให้โดด)
- **Aesthetic-Usability Effect** — สวย = รู้สึกใช้ง่าย
- **Parkinson's Law · Flow (Csikszentmihalyi) · Selective Attention/Banner Blindness**

## 9. จิตวิทยาการโน้มน้าว & พฤติกรรม (Persuasion / Behavioral)
- **Cialdini's 7 Principles** — Reciprocity · Commitment/Consistency · Social Proof · Authority · Liking · Scarcity · Unity
- **Fogg Behavior Model** — B = MAP (Behavior = Motivation × Ability × Prompt) ต้องมาบรรจบพร้อมกัน
- **Prospect Theory / Loss Aversion (Kahneman & Tversky)** — คนกลัวเสียมากกว่าชอบได้ (เท่ากัน)
- **Anchoring · Framing · Decoy Effect** — ราคา/ตัวเลือกอ้างอิงบิดการตัดสินใจ
- **Scarcity / FOMO · Commitment ladder (micro-conversions)**
- **Nudge Theory (Thaler & Sunstein)** — ออกแบบ "choice architecture" ดันพฤติกรรมโดยไม่บังคับ
- ⚠️ **Dark Patterns** — รู้ไว้เพื่อ "หลีกเลี่ยง" (หลอก/บีบ/ซ่อน) — ออกแบบอย่างมีจริยธรรม

## 10. Motion / Animation Theory
- **Disney's 12 Principles** — squash&stretch, anticipation, staging, straight-ahead/pose-to-pose, follow-through & overlapping, slow in/out (easing), arc, secondary action, timing, exaggeration, solid drawing, appeal
- **Functional Animation** — animation ต้อง "มีหน้าที่" (บอกสถานะ/นำทาง/ให้ feedback) ไม่ใช่ประดับ
- **Easing & Timing** — ease-in-out ดูเป็นธรรมชาติ; ระยะ 200-500ms สำหรับ UI
- **Choreography (Material Motion)** — ลำดับการเข้า-ออกอย่างมีจังหวะ (stagger)

## 11. Information Architecture
- **Information Scent (Information Foraging — Pirolli & Card)** — คนตาม"กลิ่น"ของลิงก์/ป้ายที่ดูจะพาไปเป้า
- **Mental Models · Card Sorting · Taxonomy**
- **Progressive Disclosure** — เผยข้อมูลทีละชั้นตามต้องการ (ลด cognitive load)
- **Wayfinding · Hick-Hyman Law**

## 12. Accessibility & Inclusive Design
- **WCAG = POUR** — Perceivable · Operable · Understandable · Robust
- contrast 4.5:1 (เล็ก) / 3:1 (ใหญ่) · color blindness (อย่าสื่อด้วยสีเดียว)
- keyboard nav + `:focus-visible` · semantic HTML + ARIA · alt text
- touch target ≥ 44×44px (WCAG/Fitts)
- **Universal Design 7 Principles** · **Microsoft Inclusive Design** (แก้เพื่อคนกลุ่มสุดขอบ ได้ประโยชน์ทุกคน)

## 13. Design Philosophy / Aesthetics
- **Dieter Rams — 10 Principles of Good Design:** innovative · useful · aesthetic · understandable · unobtrusive · honest · long-lasting · thorough · environmentally friendly · "as little design as possible"
- **Form Follows Function** (Louis Sullivan) · **Less is More** (Mies van der Rohe) · **Less but Better** (Rams)
- **Bauhaus** — ฟังก์ชัน+เรขาคณิต+ลดทอน
- **Occam's Razor / KISS** — เรียบง่ายที่สุดที่ยังได้ผล
- **Don't Make Me Think (Steve Krug)** — ลดภาระคิดของผู้ใช้
- **Wabi-Sabi** — งามในความไม่สมบูรณ์ (สำหรับงานสาย organic)

## 14. Data Visualization (Tufte & Perception)
- **Data-Ink Ratio** — เพิ่มสัดส่วน "หมึกที่เป็นข้อมูล" ลด chartjunk
- **Chartjunk · Lie Factor · Graphical Integrity** — อย่าบิดเบือนสัดส่วน
- **Small Multiples · Sparklines** (Tufte)
- **Preattentive Attributes & Cleveland-McGill ranking** — ตำแหน่ง/ความยาว อ่านแม่นกว่า มุม/พื้นที่/สี

## 15. Design Systems (Scalable)
- **Atomic Design (Brad Frost):** atoms → molecules → organisms → templates → pages
- **Design Tokens** — ค่าออกแบบ (สี/ระยะ/ฟอนต์) เป็นตัวแปรกลาง (เหมือน CSS variables)
- **8-Point Grid · Modular Scale · Component-Driven · Single Source of Truth**

## 16. Semiotics & Branding
- **Semiotics** — signifier ↔ signified (Saussure), icon/index/symbol (Peirce) → ความหมายของภาพ/สัญลักษณ์
- **Brand identity system** — โลโก้ · พาเลต · type · tone · ความสม่ำเสมอข้าม touchpoint
- **Gestalt ในโลโก้** — closure/figure-ground สร้างโลโก้ฉลาดๆ

## 17. Conversion Science (รวมกับ landing page)
- **AIDA · PAS** (ดู SKILL.md)
- **F-Pattern / Z-Pattern / Above the Fold**
- **CRO + A/B Testing** — ตัดสินด้วยข้อมูล ไม่ใช่ความเห็น
- **Friction ↔ Motivation (Fogg)** — ลด friction, เพิ่ม motivation, วาง prompt ให้ถูกเวลา

---

## วิธีใช้เล่มนี้
- ออกแบบใหม่ → ยึด §1 (หลักการ) + §3 (grid) + §4-5 (สี/ฟอนต์) + §13 (ปรัชญา)
- ตรวจ/ปรับปรุง → §7 (Nielsen heuristic evaluation) + §8 (UX laws) + §12 (a11y)
- เพิ่ม conversion → §9 (persuasion) + §17 + Fogg model
- ของเคลื่อนไหว → §10 · ระบบใหญ่ → §15

## Sources
- Laws of UX (Jon Yablonski): https://lawsofux.com
- Nielsen 10 Usability Heuristics (NN/g): https://www.nngroup.com/articles/ten-usability-heuristics/
- Shneiderman's 8 Golden Rules (IxDF): https://www.interaction-design.org/literature/article/shneiderman-s-eight-golden-rules-will-help-you-design-better-interfaces
- Don Norman — The Design of Everyday Things (affordance/signifier/feedback): https://jnd.org/affordances-and-design/
- Cialdini's 7 Principles (Influence at Work): https://www.influenceatwork.com/7-principles-of-persuasion/
- Fogg Behavior Model (Stanford): https://behaviordesign.stanford.edu/resources/fogg-behavior-model
- Gestalt Principles (IxDF): https://www.interaction-design.org/literature/topics/gestalt-principles
- 60-30-10 (LogRocket): https://blog.logrocket.com/ux-design/60-30-10-rule/
- Dieter Rams 10 Principles (Vitsœ): https://www.vitsoe.com/us/about/good-design
- Atomic Design (Brad Frost): https://atomicdesign.bradfrost.com/
- Edward Tufte — data-ink/chartjunk: https://www.edwardtufte.com/tufte/books_vdqi
