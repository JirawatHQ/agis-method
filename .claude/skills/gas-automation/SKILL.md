---
name: gas-automation
description: เชื่อม ผู้ช่วย เข้ากับ Google Apps Script (GAS) เพื่อ automate Google Workspace (Sheets/Gmail/Calendar/Drive/Forms) — มี 3 แนวทาง (gas_mcp รัน/แก้โค้ดจาก LLM, clasp dev workflow, MCPApp ทำ GAS เป็น MCP server เอง) พร้อมกลไกภายในและ setup recipe. Trigger เมื่อผู้ใช้ขอ automate Google Sheets/Forms/Workspace, ทำ time-driven trigger, deploy GAS เป็น web app, ใช้ clasp, เขียน/รัน Apps Script จาก Claude, หรือสร้าง/เชื่อม MCP server กับ Google Apps Script.
---

# Google Apps Script Automation & MCP

วิธีให้ ผู้ช่วย (หรือ LLM ใดๆ) ทำงานกับ Google Apps Script เพื่อ automate Google Workspace. กลั่นจาก research 3 repo จริง (2026-06-15).

## ⚠️ เช็คก่อนเสมอ: จำเป็นต้องใช้ GAS ไหม?
ผู้ช่วย **มี native Google MCP อยู่แล้ว** (Gmail, Calendar, Drive). ถ้างานคืออ่าน/เขียน Gmail-Calendar-Drive ธรรมดา → **ใช้ของเดิม ไม่ต้องลง GAS MCP**.

GAS คุ้มเฉพาะเมื่อต้องการสิ่งที่ native ทำไม่ได้:
- **Google Sheets** อ่าน/เขียน/สูตร/automation (native MCP ยังไม่มี Sheets)
- **Google Forms**, custom business logic
- **Time-driven triggers** — รันเองตามเวลาบน Google ไม่ต้องเปิดเครื่องคุณ
- เปิด automation ที่เขียนไว้แล้วให้ ผู้ช่วย เรียกเป็น tool

## เลือกแนวทาง (Decision Guide)

| ต้องการ | ใช้ |
|---------|-----|
| ให้ LLM **เขียน+รัน+deploy** GAS ครบวงจร, แก้ไฟล์ตรง, รันโค้ดทันทีไม่ต้อง publish | **A. gas_mcp** |
| dev GAS แบบมือโปร (Git/VS Code), version+deploy lifecycle, ใช้ official tool | **B. clasp / clasp-enhanced-mcp** |
| เปิด **Workspace automation ของคุณเองเป็น MCP tools** ให้ ผู้ช่วย เรียก, รันบน Google, time-trigger ได้ | **C. MCPApp (tanaikech)** ← น่าเชื่อถือสุด (49★, active) |

---

## A. gas_mcp (whichguy) — LLM จัดการ+รัน GAS ครบวงจร
~50 tools แบบ Unix (`ls cat write rm grep ripgrep sed find`). Node process คุยผ่าน **stdio**. ต่อ Google Apps Script API v1 + Drive/Sheets/Docs/Forms.

**กลไกเด็ด — รันโค้ดโดยไม่ต้อง deploy เอง:**
ไม่ได้ใช้ `scripts.run` endpoint แต่ใช้ **web-app doGet proxy** — ตอนเขียนไฟล์ครั้งแรกมันแอบ inject `require.gs` + `__mcp_exec.gs` (มี `doGet` → `__gas_run(js)` ที่ eval โค้ดแล้วคืน JSON+Logger). เวลา `run`/`exec` มันสร้าง/รีเฟรช web-app deployment ของ HEAD version อัตโนมัติ แล้ว HTTP-GET ไปที่ URL นั้น. `autoRedeploy=true` (default) = สร้าง version+deployment ใหม่**ทุกครั้ง** (โค้ดล่าสุดรันเสมอ แต่ version บวม + กิน quota).

**CommonJS:** แต่ละไฟล์ห่อด้วย `function _main(module, exports, log){…}` + `__defineModule__(_main)`; `cat`/`write` ถอด/ใส่ wrapper ให้อัตโนมัติ (LLM เห็นโค้ดสะอาด), `raw_cat`/`raw_write` เก็บ byte ตรง. ชื่อไฟล์ไม่มีนามสกุล (`Calculator` ไม่ใช่ `Calculator.gs`).

**Deploy:** `deploy` รวม dev(HEAD)→staging→prod + promote/rollback/status. `rsync` = pull/push, `git_feature` = branch.

**Setup:**
```bash
git clone https://github.com/whichguy/mcp_gas.git && cd mcp_gas && npm install && npm run build
```
1. GCP: enable Apps Script API, สร้าง OAuth **Desktop** creds → `oauth-config.json` ใน repo root
2. config: `{"mcpServers":{"gas":{"command":"node","args":["/abs/path/mcp_gas/dist/src/index.js"]}}}`
3. restart → รัน `auth` → consent. Token เก็บที่ `~/.auth/mcp-gas/tokens/<email>.json`

**Gotcha:** เพดานรัน 6 นาที; autoRedeploy ทำ version บวม+กิน API quota; ต้องขอ scope กว้าง (Drive/Sheets/Docs/Forms = consent เยอะ); ไม่มี npm package ต้อง build เอง; adoption ต่ำ (4★) = ไม่มี community.

---

## B. clasp + clasp-enhanced-mcp (redmorestudio) — dev workflow มาตรฐาน
20+ tools **ห่อ official `@google/clasp` CLI** (ไม่ได้ยิง Google API ตรง — spawn child process `clasp` ทุก tool). **ทักษะจริงที่ได้คือ clasp workflow เอง.**

**clasp คืออะไร:** Command Line Apps Script Projects — sync โค้ดระหว่าง **folder local ↔ GAS project remote**. โมเดล: **แก้ไฟล์ local → push ขึ้น remote** (ไม่แก้ remote ตรงๆ). ได้ Git/VS Code/TypeScript แทน browser editor.

**ไฟล์สำคัญ:** `~/.clasprc.json` (OAuth token — sensitive), `.clasp.json` (scriptId/rootDir/projectId ต่อ project), `appsscript.json` (manifest: runtime/timezone/scopes/webapp config).

**Workflow:** `clasp_create{title,type}` (standalone/sheets/forms/webapp/api...) หรือ `clasp_clone{scriptId}` → แก้ไฟล์ → `clasp_pull`/`clasp_push` → `clasp_version` (snapshot) → `clasp_deploy{versionNumber,deploymentId}` (omit id=สร้างใหม่, ใส่=update).

**clasp_run (gotcha สูง):** รัน function บน cloud ต้องครบ: login + เปิด Apps Script API + deploy เป็น **"API Executable"** + ใส่ `projectId` (GCP) ใน `.clasp.json` + ถ้าใช้ Gmail/Drive ต้องใส่ scope ใน `appsscript.json` แล้ว re-login.

**Setup:** Node 16+, `npm install -g @google/clasp`, config `{"mcpServers":{"clasp-enhanced":{"command":"node","args":["/abs/path/index.js"]}}}`, restart → `clasp_login` → **เปิด Apps Script API ที่ script.google.com/home/usersettings** (error "User has not enabled the Apps Script API" มาจากข้ามขั้นนี้).

**ข้อจำกัด:** ทำผ่าน clasp เท่านั้น (สืบทอด bug ของ clasp), ไม่มี remote edit ตรง (push ทับ ไม่ patch), repo ซบ (7★, 5 commits).

---

## C. MCPApp (tanaikech) — ทำ GAS เป็น MCP server เอง ★แนะนำ
**กลับด้านกับ A/B:** ไม่ใช่สั่ง GAS จาก LLM แต่ทำให้ **GAS Web App ของคุณกลายเป็น MCP server** ที่ client ใดก็เรียกได้. v2.3.0 (มิ.ย. 2026), 49★, author สาย GAS ที่ดัง+active.

**กลไก — JSON-RPC over doPost:** client POST MCP JSON-RPC (`initialize`/`tools/list`/`tools/call`) ไปที่ Web App `/exec` URL → `doPost(e)` รับ → MCPApp parse+validate `accessKey`+dispatch:
```javascript
const doPost = (e) => main(e);
function main(eventObject) {
  const object = { eventObject, items: getObjects_() };
  return new MCPApp.mcpApp({ accessKey: "sample" })
    .setServices({ lock: LockService.getScriptLock() })
    .server(object);
}
```
**Transport bridge:** GAS พูดแค่ HTTP แต่ desktop client อยากได้ stdio → client รัน **`mcp-remote`** (npx proxy stdio↔HTTP) ชี้ไปที่ exec URL. ไม่มี server local ให้ host — mcp-remote เป็นแค่สะพานบาง.

**นิยาม tool:** name → schema (JSON Schema) + implementation function. MCPApp แปลงเป็น `tools/list` แล้ว route `tools/call` ตามชื่อไปยัง function ของคุณ.

**ทำไมทรงพลัง:** รันด้วย identity ของคุณ ("Execute as: Me") → เข้าถึง `SpreadsheetApp/GmailApp/CalendarApp/DriveApp/DocumentApp/UrlFetchApp` + Gemini **ตรงๆ ไม่ต้อง OAuth/API key**, อยู่บน server Google (ไม่ต้องเปิดเครื่อง), **time-trigger ได้**, snippet GAS เดิมกลายเป็น tool ทันที. companion repo **ToolsForMCPServer** มี ~40 Workspace tools สำเร็จรูป (`m.getTools()`).

**Setup:**
1. เพิ่ม MCPApp เป็น GAS library (หรือ paste โค้ด)
2. เขียน `doPost` เรียก `new MCPApp.mcpApp({accessKey}).setServices({lock}).server(object)`
3. Deploy → New deployment → **Web App**, Execute as **Me**, access **Anyone** (URL+accessKey เป็นด่านเดียว)
4. config client: `{"mcpServers":{"gas_web_apps":{"command":"npx","args":["mcp-remote","https://script.google.com/macros/s/###/exec?accessKey=sample"]}}}`

**Gotcha:** access "Anyone" = URL+accessKey คือ secret อย่าหลุด; LockService serialize (default), `lock:false` ได้ parallel แต่ห้ามเกิน **30 concurrent** (เพดาน GAS); แก้โค้ดต้อง deploy version ใหม่ทุกครั้งไม่งั้น client เจอโค้ดเก่า. v2.0.0+ GAS เป็น MCP **client** ได้ด้วย → ทำ "MCP Network" (GAS เรียก GAS).

---

## ปรับใช้ (ตัวอย่าง use case)
- **บันทึกข้อมูลลง Sheet:** MCPApp เปิด tool `appendRow`/`getRows` ให้ผู้ช่วยเรียก → log อัตโนมัติลง Google Sheets
- **แจ้งเตือนตามเวลา:** time-driven trigger บน GAS ส่งสรุป/เตือน → ไม่ต้องพึ่ง cron เครื่องตัวเอง
- **เลือกตัวไหน:** automate Workspace ระยะยาวให้ผู้ช่วยเรียก → **MCPApp**. ให้ผู้ช่วยเขียน/รันโค้ด GAS ad-hoc ระหว่าง dev → **gas_mcp**. ทีม dev version control → **clasp**.

> ความปลอดภัย: อย่า sync ข้อมูลส่วนตัว/อ่อนไหวขึ้น server ที่แชร์. GAS Web App URL = secret เก็บให้ดี.

---
## Connections
- [[CLAUDE]]
- [[README]]
