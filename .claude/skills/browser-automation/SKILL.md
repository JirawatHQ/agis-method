---
name: browser-automation
description: ขับเบราว์เซอร์จริงด้วย Playwright MCP เพื่อ scrape เว็บที่ render ด้วย JS (SPA), login เข้าระบบที่ต้อง auth, กรอกฟอร์ม, ดึงข้อมูลแบบ structured, และ batch. Trigger เมื่อผู้ใช้ขอ scrape/ดึงข้อมูลจากเว็บ, เปิดเว็บแล้วเอาข้อมูลมา, login เว็บอัตโนมัติ, กรอกฟอร์ม/กดปุ่มบนเว็บ, ทดสอบ flow บนหน้าเว็บ, ดึงข้อมูลหลังบ้านที่ต้องล็อกอิน, หรือ automate งานบนเว็บราชการ/พอร์ทัล. ใช้เมื่อ WebFetch/requests ไม่พอเพราะหน้าเป็น JS/ต้อง login/ต้อง interact. รวมถึงเมื่อโดนบล็อก/เจอ anti-bot (Cloudflare/fingerprint) หรือต้อง scrape หลายหน้า/ยาว ให้ทนไม่พังกลางทาง.
---

# Browser Automation (Playwright MCP)

Playbook ขับเบราว์เซอร์จริงผ่าน Playwright MCP. กลั่นจาก use-case จริงที่ verified (2026-06-15): scrape SPA ราชการ, login sandbox, login ระบบ TDEX กสทช.

## ⚠️ เช็คก่อน: ต้องใช้ Playwright จริงไหม?
| สถานการณ์ | ใช้อะไร |
|-----------|---------|
| หน้า static / มี HTML ตรงๆ / API endpoint | **WebFetch / requests** (เร็ว ถูกกว่า) ไม่ต้องเปิด browser |
| หน้า SPA / เนื้อหา render ด้วย JS / curl ได้ HTML เปล่า | **Playwright** |
| ต้อง login / กรอกฟอร์ม / กดปุ่ม / มี session | **Playwright** |
| ต้องดูภาพหน้าเว็บ / screenshot หลักฐาน | **Playwright** |

> เช็คเร็ว: ลอง WebFetch ก่อน ถ้าได้ข้อมูลครบจบเลย; ถ้าได้แต่ skeleton/`<div id=root>` เปล่า = SPA → Playwright
> โดนบล็อก/เจอ Cloudflare/fingerprint หรืองานหลายหน้า/ยาว → ดูหัวข้อ **Anti-bot & fingerprinting** และ **Reliable pipeline** ด้านล่าง (หลัก tool-agnostic ใช้ได้ทั้ง requests/Scrapling/Playwright)

## Tool map
- `browser_navigate` — เปิด URL
- `browser_snapshot` — accessibility tree (ได้ **ref** ของ element ไว้สั่ง action) — ใช้ก่อนจะคลิก/กรอก
- `browser_evaluate` — รัน JS บนหน้า → **ดึงข้อมูล structured** (ดีกว่า parse snapshot)
- `browser_fill_form` — กรอกหลายช่องรวด, `browser_type` — พิมพ์ช่องเดียว (มี `submit:true` = กด Enter)
- `browser_click` — คลิก, `browser_take_screenshot` — แคป, `browser_close` — ปิด session (ทำทุกครั้งจบงาน)

## Pattern 1 — Scrape (ดึงข้อมูล)
```
navigate → (snapshot ถ้าต้องดูโครง) → evaluate ดึง structured → close
```
ใช้ `browser_evaluate` extract เป็น object/array ไม่ใช่อ่าน snapshot ดิบ:
```js
() => [...document.querySelectorAll('table tbody tr')]
  .map(tr => [...tr.querySelectorAll('td')].map(td => td.innerText.trim()))
```
ดึง heading/link/meta พร้อมกัน, filter ที่หน้าก่อนส่งกลับ (ลด token).

## Pattern 2 — Login flow
```
navigate /login → snapshot หา ref ช่อง → fill_form email+pass → click submit
→ verify ผ่าน URL redirect + flash message → (ไปหน้าถัดไป) → ... → close
```
ตรวจ success/fail ด้วย evaluate:
```js
() => ({ url: location.pathname,
         ok: /dashboard|secure/.test(location.pathname),
         flash: document.querySelector('#flash,.flash,.error')?.innerText.trim() })
```
**เจอ OTP/MFA → หยุด ส่งให้ผู้ใช้กรอกเอง** อย่าเดา.

## Golden rules (จากของจริง — กันพลาดซ้ำ)
1. **ref จาก snapshot เป็นของชั่วคราว** — เปลี่ยนทุก snapshot และ stale หลัง page reload. ใน flow ที่หน้าเปลี่ยน → ใช้ **CSS / role / placeholder** selector (`#username`, `textbox name=...`) เสถียรกว่า. ใช้ ref เฉพาะ action ทันทีหลัง snapshot เดียวกัน.
2. **extract ด้วย `evaluate` ไม่ใช่ตา** — อย่าอ่านตัวเลข/ข้อความจาก snapshot แล้วพิมพ์ตามใน report. ดึงค่าจริงด้วย JS (feedback_no_hallucinate_prompt).
3. **ระวัง label เพี้ยนในเว็บจริง** — เคย verify เจอปุ่มสะกดผิด `"Sing In"` (ไม่ใช่ Sign). ใช้ชื่อตามที่ snapshot คืนมาเป๊ะ.
4. **SPA = ต้องรอ render** — Playwright รัน JS ให้; ถ้าผลยังว่างให้ snapshot/evaluate ซ้ำหลัง action.
5. **`browser_close` ทุกครั้งจบงาน** — ไม่ทิ้ง session ค้าง.
6. screenshot เก็บเป็นหลักฐานเมื่อ login/ดึงผลสำเร็จ (`.playwright-mcp/`).

## Credential & Security (สำคัญ — งานราชการ/พอร์ทัล)
- **ห้ามเก็บรหัสผ่านลงไฟล์/memory/skill/wiki.** เก็บใน **macOS Keychain**:
  ```bash
  security add-generic-password -a "<user>" -s "<service>" -w "<pass>" -U   # เก็บ/อัปเดต
  security find-generic-password -a "<user>" -s "<service>" -w               # ดึงตอนใช้
  ```
- ผลลัพธ์ที่มี **PII/ข้อมูลบุคคลที่สาม** → เก็บ **local เท่านั้น** ไม่ขึ้น cloud/server ที่แชร์.
- **ระบบ production/ราชการ:** query ถูก audit ผูกชื่อผู้ login → ทำเฉพาะที่ผู้ใช้มีสิทธิ์/มีฐานทางกฎหมาย. ถ้าเป็นข้อมูลบุคคลที่สามที่ยืนยัน authorization ไม่ได้ → **หยุด ถามก่อน** ไม่รวบขับให้.
- anti-bot: Playwright = Chromium จริง, ปริมาณน้อย/ทำเหมือนคนกด = ปกติ; อย่ายิงถี่จน trip WAF.

## Batch (หลายรายการ)
- ถ้าเว็บมีปุ่ม Upload/Download ในตัว → ใช้ของเว็บ (เร็วกว่ายิงทีละอันผ่าน browser)
- ถ้าไม่มี → loop navigate+evaluate ต่อรายการ, throttle, รวมผลเป็นไฟล์เดียว

## Anti-bot & fingerprinting — เว็บจับบอทจากอะไร (tool-agnostic + dual-use งานไซเบอร์)
เว็บ/Cloudflare จับบอทจากหลายสัญญาณ ไม่ใช่แค่ IP — เข้าใจกลไก = แก้ถูกจุด:
- **TLS / JA3 fingerprint** — ลายนิ้วมือจาก TLS handshake; `requests`/`curl` มีลายเฉพาะที่ต่างจาก browser จริง → โดนจับแม้ headers ครบ
- **Browser fingerprint** — User-Agent, ลำดับ headers, `navigator.webdriver`, canvas/WebGL, fonts
- **พฤติกรรม** — เร็ว/สม่ำเสมอเกินคน, ไม่ขยับเมาส์, ยิงถี่ → pattern/rate detection
- **Challenge** — CAPTCHA / Cloudflare Turnstile / JS challenge

รับมือแบบ escalation ladder (เลือก**ระดับต่ำสุดที่พองาน** — ยิ่งสูงยิ่งช้า/แพง):
1. `requests` + headers ครบ — ง่าย แต่โดน TLS fingerprint จับ
2. HTTP + **impersonation** (ปลอม TLS/JA3 ให้เหมือน browser — `curl_cffi`, Scrapling `Fetcher`) — ผ่านเว็บที่เช็ค fingerprint โดยไม่เปิด browser
3. **stealth browser** (patch `navigator.webdriver` ฯลฯ — Scrapling `StealthyFetcher` เคลม bypass Cloudflare Turnstile)
4. **full browser** (Playwright MCP) — เนียนสุด ช้าสุด สำหรับ SPA/interact
> **Dual-use:** เข้าใจ fingerprint/stealth = เข้าใจว่าบอท/สแกมเมอร์หลบการตรวจจับยังไง (มีประโยชน์กับงานสืบสวน/ความปลอดภัย) — ใช้เท่าที่ได้รับอนุญาตเท่านั้น

## Reliable pipeline — งานหลายหน้า/ยาว (ไม่พังกลางทาง)
- **Checkpoint** — เก็บว่าเก็บถึงหน้า/รายการไหนแล้ว (ไฟล์/DB) → รันใหม่ต่อจากเดิม ไม่เริ่มศูนย์
- **Idempotent** — ดึงซ้ำรายการเดิมต้องไม่เพิ่ม/เพี้ยน (key ด้วย id จริง ไม่ append มั่ว)
- **Retry + backoff** — ล้ม/timeout/429 → ลองใหม่เว้นระยะเพิ่มขึ้น (1s→2s→4s)
- **Rate limit / throttle** — เว้นจังหวะ ไม่ยิงถี่จน trip WAF หรือกระทบเว็บปลายทาง
- **Detection monitoring** — ทุกรอบเช็ค 3 อย่าง: (ก) โครงเปลี่ยน? (selector หลักยังเจอไหม) (ข) ข้อมูลหายผิดปกติ? (count ตกฮวบ = สัญญาณ) (ค) โดนบล็อก? (เจอ challenge/403/429) → **หยุด + แจ้ง อย่าดึงขยะต่อ**
- **Resilient selector** — anchor กับสิ่งเสถียร (id/`data-*`/ข้อความ) + fallback หลายชั้น; เลี่ยง path ตำแหน่ง (ต่อยอด golden rule 1)

## เก็บความรู้: เว็บไหนใช้ซ้ำ → ทำ runbook
เว็บที่ผู้ใช้จะใช้ซ้ำ (login + ขั้นตอนเฉพาะ) → เขียน **runbook** ใน wiki ทีมที่เกี่ยว
(เมนู map + selector ที่ verified + ขั้นตอน + กฎ security) เพื่อ reuse รอบหน้า.
- **Case study:** context/wiki/cyber/tdex_runbook — login TDEX กสทช. + ค้นค่ายเบอร์

---
## Connections
- [[CLAUDE]]
- [[README]]
