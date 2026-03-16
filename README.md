# OpenClaw Workshop — AI Business Assistant Kit

**Built by Selr AI — [selrai.com.au](https://selrai.com.au)**

> Give your business an AI assistant that remembers who you are, learns your business, and gets smarter every time you use it — without writing a single line of code.

---

## What Is This?

This kit sets up a personal AI business assistant on your laptop. Not a chatbot you close and forget — an assistant that:

- **Remembers your business** — your name, your customers, your biggest challenges
- **Lives on your computer** — runs locally, not in a browser tab
- **Controls your browser** — can open websites, fill forms, and do research for you
- **Has 16 specialist skills** — research, copywriting, sales emails, social content, competitor analysis, and more
- **Gets smarter over time** — every conversation builds on the last

It is built on [Claude Code](https://claude.ai/claude-code) by Anthropic — the same AI that powers Claude, configured specifically for your business.

---

## Who Is This For?

**Workshop attendees** — follow the setup guide below. Your assistant will walk you through everything.

**Developers** — see [DEVELOPER.md](DEVELOPER.md) for the full technical breakdown, architecture, and how to extend or customise this kit.

---

## How It Works

```text
Your Laptop
    └── VS Code (your workspace app)
         └── Claude Code (your AI assistant)
              ├── CLAUDE.md (your assistant's instructions + memory loader)
              ├── memory/ (saves what it learns about you)
              ├── skills/ (16 specialist capabilities)
              └── Playwright (browser remote control)
```

**Three phases happen automatically on first run:**

| Phase | What Happens |
|---|---|
| **1. Setup** | Installs tools, connects browser automation, opens your workspace |
| **2. Onboarding** | Your assistant asks 7 questions and saves your profile forever |
| **3. Demo** | Your assistant picks a task based on your biggest challenge and does it live |

After that, every time you open VS Code and type `claude`, your assistant already knows who you are.

---

## Quick Start

**Before the workshop**, complete these 3 steps — takes about 15 minutes:

1. Get a **Claude Max** subscription at [claude.ai](https://claude.ai) ($100 USD/month)
2. Install **VS Code** at [code.visualstudio.com](https://code.visualstudio.com)
3. Install the **Claude Code extension** inside VS Code (search "Claude Code" in Extensions)

Full pre-workshop checklist: [docs/PRE-WORKSHOP-CHECKLIST.md](docs/PRE-WORKSHOP-CHECKLIST.md)

**Windows users:** also read [docs/WINDOWS-SETUP.md](docs/WINDOWS-SETUP.md) before arriving.

---

## At the Workshop

Open VS Code, then open the terminal inside it and run:

```bash
git clone https://github.com/luke-selrai/openclaw-workshop-kit.git ~/workshop-kit
cd ~/workshop-kit && bash setup.sh
```

Then start your assistant:

```bash
cd ~/my-assistant && claude
```

Your assistant takes it from there. It will greet you, install everything it needs, ask about your business, and show you what it can do — all in plain English, one step at a time.

---

## Your 16 Business Skills

Skills are specialist capabilities your assistant can use. Think of them like switching your assistant from "general helper" to "expert copywriter" or "market researcher" for a specific task.

| Skill | What It Does |
|---|---|
| `deep-research` | Researches any topic in depth — competitors, markets, trends |
| `research-analyst` | Deep competitive and market analysis with structured reports |
| `reddit-insights` | Mines Reddit for honest customer opinions and pain points |
| `competitor-alternatives` | Maps out your competitive landscape |
| `copywriting` | Writes persuasive marketing copy for any platform |
| `humanizer` | Makes AI-written content sound natural and human |
| `avoid-ai-writing` | Strips out robotic AI patterns from any text |
| `content-creator` | Long-form SEO articles and blog content |
| `social-content` | Social media posts for LinkedIn, Instagram, Facebook |
| `email-sequence` | Automated email campaigns and follow-up sequences |
| `sales-automator` | Cold outreach emails and sales templates |
| `youtube-summarizer` | Pulls transcripts and summaries from any YouTube video |
| `brainstorming` | Structured idea generation for any business challenge |
| `prompt-engineer` | Improves how you talk to AI to get better results |
| `writing-plans` | Plans complex tasks before executing them |
| `systematic-debugging` | Diagnoses and fixes problems step by step |

---

## What's In This Kit

```text
workshop-kit/
├── CLAUDE.md                    # Your assistant's brain — instructions + setup wizard
├── setup.sh                     # One-command installer (Mac + Windows)
├── my-assistant/                # Copied to ~/my-assistant/ on your computer
│   ├── CLAUDE.md                # Your assistant's config
│   ├── .mcp.json                # Auto-connects browser automation on startup
│   └── memory/                  # Where your assistant saves what it learns
│       ├── USER.md              # Your profile (filled in on first run)
│       └── SETUP.md             # Setup completion status
├── skills/                      # 16 business skills (installed to ~/.claude/skills/)
├── docs/
│   ├── PRE-WORKSHOP-CHECKLIST.md   # What to do before arriving
│   ├── WINDOWS-SETUP.md            # Step-by-step Windows guide
│   ├── COMPLETION-GUIDE.md         # What to do after the workshop
│   ├── SKILLS-REFERENCE.md         # How to use each skill
│   ├── WORKSHOP-RUNSHEET.md        # Luke's facilitator script (3-hour runsheet)
│   ├── FIRST-5-PROMPTS.md          # Copy-paste prompts to get started
│   ├── SUBSCRIPTIONS-AND-SOFTWARE.md  # What costs what
│   └── GLOSSARY.md              # Plain English definitions of every tech term
└── visuals/                     # Printable explainer pages (4 pages, PNG + MD)
```

---

## After the Workshop

Your assistant is now yours. A few things to explore next:

- **Add Gmail** — `claude mcp add gmail npx @gptscript-ai/gmail-mcp`
- **Add Google Calendar** — `claude mcp add google-calendar npx @gptscript-ai/google-calendar-mcp`
- **Add Telegram** (get phone notifications when tasks finish) — see [docs/COMPLETION-GUIDE.md](docs/COMPLETION-GUIDE.md)
- **Upgrade your skills** — Selr AI offers advanced skill packs for deeper automation

Full guide: [docs/COMPLETION-GUIDE.md](docs/COMPLETION-GUIDE.md)

---

---

## Common Questions

**Is my data private?**
Yes. Your memory files (`~/my-assistant/memory/`) live on your computer only. Nothing is sent to a third party except your conversations with Claude (which go to Anthropic, same as using claude.ai normally).

**What does it cost after the workshop?**
Claude Max is $100 USD/month (~$155 AUD). That is the only required cost. Everything else in this kit is free.

**What if I miss a step during setup?**
Your assistant will notice and offer to fix it. Or re-run `bash ~/workshop-kit/setup.sh` at any time — it is safe to run multiple times.

**Can I use this on Windows?**
Yes. See [docs/WINDOWS-SETUP.md](docs/WINDOWS-SETUP.md) for the complete Windows walkthrough.

**I am a developer — how do I customise this?**
See [DEVELOPER.md](DEVELOPER.md).

---

## Support

- Workshop guides: [`docs/`](docs/)
- Windows guide: [`docs/WINDOWS-SETUP.md`](docs/WINDOWS-SETUP.md)
- Selr AI: [selrai.com.au](https://selrai.com.au)
- Email: [luke@selrai.com.au](mailto:luke@selrai.com.au)

---

OpenClaw Workshop Kit — March 2026 — Built by Selr AI
