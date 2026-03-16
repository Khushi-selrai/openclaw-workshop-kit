# PAGE 4 — The Full Ecosystem: CLI, MCP, and API Tools

---

## The Complete Picture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        YOUR AI BUSINESS ECOSYSTEM                            │
│                                                                               │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                         YOU (The CEO)                                │    │
│  │               Chat • Review • Approve • Direct                       │    │
│  └───────────────────────────────┬─────────────────────────────────────┘    │
│                                  │                                            │
│                                  ▼                                            │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                        CLAUDE CODE                                   │    │
│  │                    (Your AI Brain + Body)                            │    │
│  │                                                                       │    │
│  │   Reads: CLAUDE.md (instructions) + USER.md (memory)                │    │
│  │   Uses:  Skills (specialised abilities)                               │    │
│  │   Via:   CLI tools + MCP connections + API calls                     │    │
│  └───────┬──────────────┬───────────────────┬────────────────┬─────────┘    │
│          │              │                   │                │               │
│          ▼              ▼                   ▼                ▼               │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐      │
│  │  CLI TOOLS   │ │  MCP TOOLS   │ │  API TOOLS   │ │   BROWSER    │      │
│  │              │ │              │ │              │ │ AUTOMATION   │      │
│  │  Git         │ │  Gmail       │ │  OpenAI      │ │              │      │
│  │  Node.js     │ │  Calendar    │ │  Stripe      │ │  Fill forms  │      │
│  │  Python      │ │  Notion      │ │  GHL CRM     │ │  Click links │      │
│  │  npm         │ │  Playwright  │ │  Xero        │ │  Screenshot  │      │
│  │  Scripts     │ │  Slack       │ │  Any service │ │  Scrape data │      │
│  └──────────────┘ └──────────────┘ └──────────────┘ └──────────────┘      │
│          │              │                   │                │               │
│          └──────────────┴───────────────────┴────────────────┘              │
│                                  │                                            │
│                                  ▼                                            │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                      📱 TELEGRAM                                     │    │
│  │              Results, Alerts & Reports → Your Phone                  │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                               │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## The Three Types of Tools

### CLI Tools — Command Line Interface
Programs you install on your computer that Claude can use by typing commands.

```
EXAMPLES:
git      → Downloads and tracks files (how we installed your setup)
node     → Runs JavaScript programs
python   → Runs Python scripts
npm      → Installs other programs (like an app store for tools)
claude   → Starts Claude Code itself

HOW TO THINK OF IT:
These are tools installed on your computer permanently.
Like having Photoshop installed — it's there when you need it.
```

### MCP Tools — Model Context Protocol
Live connections between Claude and other apps. Claude can read and write to these apps in real time.

```
EXAMPLES:
Gmail MCP      → Claude reads/searches your email
Calendar MCP   → Claude reads your calendar, finds free time
Notion MCP     → Claude reads and updates your Notion workspace
Playwright MCP → Claude controls your browser

HOW TO THINK OF IT:
MCP tools are like giving Claude a login to your apps.
Like giving your assistant the keys to your filing cabinet.
```

### API Tools — Application Programming Interface
Direct connections to online services via their official programming interface.

```
EXAMPLES:
Stripe API    → Process payments, check revenue, manage subscriptions
GHL CRM API   → Manage contacts, send messages, update deals
Xero API      → Read invoices, expenses, financial data
OpenAI API    → Use GPT models as well as Claude

HOW TO THINK OF IT:
APIs are like a phone line between two apps.
When Claude "calls" Stripe's API, Stripe answers with your data.
```

---

## What "Connecting" a Tool Means

When we say "connect" a tool, we mean Claude is given permission to access it.

```
STEP 1: You install the tool   →  "claude mcp add gmail ..."
STEP 2: Claude asks permission →  You click "Allow" in browser
STEP 3: Tool is connected      →  Claude can now use it
STEP 4: Stays connected        →  Works every time, no re-login
```

---

## Common Questions

**"Can Claude see all my private data?"**
Only what you give it access to. You control which tools are connected. Claude doesn't have access to anything you haven't specifically connected.

**"Is it safe?"**
Claude never takes big actions (sending emails, posting online, deleting files) without asking you first — as long as CLAUDE.md is set up correctly (ours is).

**"Does it cost extra to connect tools?"**
Most MCP connections are free. Some APIs have their own costs (e.g. Stripe charges transaction fees, but they're the same whether Claude uses it or you log in manually).

**"Can I disconnect a tool?"**
Yes. Run `claude mcp remove [tool-name]` at any time.

---

## The Tools You Have Connected Today

| Tool | Type | What It Does |
|---|---|---|
| Claude Code | CLI | Runs your AI assistant |
| Playwright | MCP | Controls your browser |
| Gmail | MCP | Reads and searches your email |
| Git | CLI | Downloads files from the internet |
| Node.js | CLI | Runs programs |

**Coming Soon (after workshop):**
- Google Calendar MCP
- Notion MCP
- Your CRM (GHL or HubSpot)
- Telegram (for phone notifications)

---

## The Path Forward

```
TODAY                    30 DAYS                  90 DAYS
─────────────────────    ─────────────────────    ─────────────────────
✅ Claude Code set up    Add more MCP tools       Deploy your first agent
✅ 16 skills installed   Connect your CRM         Automate lead follow-up
✅ Browser control       Set up Telegram          Content posts automatically
✅ Email access          Build first automation   Monthly reports auto-sent
✅ Memory of your biz    Regular AI workflows     AI running your processes
```

---

## Getting Help

- **Luke (workshop leader):** Direct message / workshop support
- **Full guide:** ~/workshop-kit/docs/COMPLETION-GUIDE.md
- **Claude.ai docs:** claude.ai/docs
- **Selr AI:** selrai.com.au

> The best way to learn is to just try things. Ask Claude to do something for your business right now. See what happens. You can't break anything that can't be fixed.

---

*OpenClaw Workshop — selrai.com.au*
