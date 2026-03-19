# Developer Notes — OpenClaw Workshop Kit

**Repo:** https://github.com/luke-selrai/openclaw-workshop-kit
**Contact:** Luke Heka — luke@selrai.com.au
**Workshop:** Tomorrow (Mar 17/19), 20 non-technical business owners, 3 hours

---

## What This Is

A self-installing AI business assistant kit. Non-technical business owners:
1. Install VS Code + Claude Code extension (done before workshop)
2. Paste a bootstrap prompt (from a Notion page) into Claude Code
3. Claude Code clones the repo, copies skills, creates the workspace — all conversationally
4. They open `~/my-assistant/` in VS Code, start Claude Code, and the CLAUDE.md agent takes over for onboarding and demos

---

## Repo Structure

```
openclaw-workshop-kit/
├── CLAUDE.md                        # Pointer to my-assistant/CLAUDE.md (not used by the assistant)
├── setup.sh.deprecated              # Old bash installer (kept for reference only)
├── README.md                        # End-user quickstart
│
├── my-assistant/                    # THIS is what gets copied to ~/my-assistant/
│   ├── CLAUDE.md                    # AI agent brain — onboarding + demo agent
│   └── memory/
│       ├── USER.md                  # Onboarding placeholder (status: not-yet-onboarded)
│       ├── SETUP.md                 # Setup status tracker
│       └── MEMORY.md               # Persistent memory across conversations
│
├── skills/                          # 92 bundled business skills
│   ├── humanizer/
│   ├── deep-research/
│   ├── copywriting/
│   ├── email-sequence/
│   ├── social-content/
│   ├── content-creator/
│   ├── sales-automator/
│   ├── brainstorming/
│   ├── youtube-summarizer/
│   ├── reddit-insights/
│   ├── competitor-alternatives/
│   ├── avoid-ai-writing/
│   ├── research-analyst/
│   ├── prompt-engineer/
│   ├── systematic-debugging/
│   └── writing-plans/
│
├── docs/
│   ├── PRE-WORKSHOP-CHECKLIST.md    # Send to attendees the day before
│   ├── SUBSCRIPTIONS-AND-SOFTWARE.md # Full cost breakdown
│   ├── WORKSHOP-RUNSHEET.md         # Luke's 3-hour facilitator script
│   ├── FIRST-5-PROMPTS.md           # Print + hand out — copy-paste prompts
│   ├── GLOSSARY.md                  # Plain-English tech terms
│   ├── COMPLETION-GUIDE.md          # Finishing setup at home after workshop
│   └── SKILLS-REFERENCE.md         # Every skill explained with examples
│
└── visuals/                         # Printable 4-page reference set
    ├── PAGE-1-AI-MODELS.md          # What AI is, Claude vs GPT vs Gemini, pricing
    ├── PAGE-2-YOUR-SETUP.md         # VS Code + Terminal + Claude Code diagram
    ├── PAGE-3-SKILLS-AND-AGENTS.md  # Skills, agents, Telegram explained
    ├── PAGE-4-FULL-ECOSYSTEM.md     # Full ecosystem diagram
    └── page-1 to page-4 .png        # Generated image versions
```

---

## How the Setup Flow Works

The setup is now fully conversational — no bash scripts involved.

**Step 1: Bootstrap prompt (in any directory)**

Attendees copy a bootstrap prompt from the workshop Notion page and paste it into Claude Code. The bootstrap prompt instructs Claude to:
1. Clone the repo to `~/workshop-kit`
2. Copy skills from `skills/` to `~/.claude/skills/`
3. Copy `my-assistant/` to `~/my-assistant/`
4. Add Playwright MCP via `claude mcp add` command (no `.mcp.json` file needed)

No Node.js or Git pre-install needed on Mac. Windows users only need Git for Windows.

**Step 2: Open the workspace**

The user opens `~/my-assistant/` in VS Code and starts Claude Code. Claude reads `my-assistant/CLAUDE.md` and the agent takes over:
1. **Onboarding:** Asks 7 questions about their business, saves to `~/my-assistant/memory/USER.md`
2. **Demo:** Runs a live demo task matched to their stated business challenge

**Key design decisions:**
- The Notion page is the single source of truth for attendees — the bootstrap prompt lives there and can be updated without pushing to GitHub
- The root `CLAUDE.md` is now just a brief pointer to `my-assistant/CLAUDE.md`
- Playwright MCP is added via `claude mcp add` at the user scope, not via a `.mcp.json` file in the workspace
- `setup.sh` has been renamed to `setup.sh.deprecated` and kept for reference only

---

## What Needs Work (Priority Order)

### HIGH — Test the full bootstrap flow

The most important thing is a clean end-to-end test:
1. On a fresh Mac (or a new Mac user account) — not a developer machine
2. Open VS Code, start Claude Code, paste the bootstrap prompt
3. Does the repo clone, skill copy, and workspace creation all succeed?
4. Does opening `~/my-assistant/` in VS Code + starting Claude Code trigger the onboarding agent?
5. Does the Playwright MCP install step work (`claude mcp add` at user scope)?
6. Does onboarding save to the right path?

**Known potential issues:**
- `git clone` may trigger Xcode popup on fresh Mac — the bootstrap prompt should handle this gracefully
- Playwright MCP install command: `claude mcp add playwright npx @playwright/mcp@latest --scope user` — verify this is the correct syntax for the current Claude Code version
- `~/.claude/skills/` path — verify the bootstrap prompt copies skills here correctly

### HIGH — Windows support

Windows users need Git for Windows installed before running the bootstrap prompt. No other pre-installs required.
- Verify the bootstrap prompt works in Git Bash / PowerShell terminal inside VS Code
- `docs/WINDOWS-SETUP.md` should reflect the new bootstrap flow

### MEDIUM — MCP command validation

The MCP install commands in `COMPLETION-GUIDE.md` for Gmail and Google Calendar may be outdated:
```bash
# These need to be verified against current Claude Code MCP registry:
claude mcp add gmail npx @gptscript-ai/gmail-mcp
claude mcp add google-calendar npx @gptscript-ai/google-calendar-mcp
```
Check the current Claude Code docs for correct package names.

### MEDIUM — Playwright smoke test

After setup, there should be a quick test to confirm Playwright is working:
```bash
# Claude should be able to run something like:
# "Take a screenshot of google.com"
# and have it succeed
```

### LOW — Skills validation

Each skill in `skills/` is a SKILL.md file. Quick scan to check:
- All SKILL.md files are valid
- No Luke-specific content (personal API keys, specific business references)
- Descriptions are appropriate for non-technical business owners

---

## Update System

Attendees can pull updates from GitHub:

```bash
cd ~/workshop-kit && git pull origin main
```

For pushing updates to everyone: just commit to `main`. Next time they pull, they get everything new. The bootstrap prompt on Notion can also be updated independently — it is the single source of truth for the setup flow.

**Planned future updates:**
- More skills as they get built
- Additional MCP connections (Slack, HubSpot, Xero, etc.)
- Improved onboarding questions
- Server setup guide (for always-on agents)

---

## Tech Stack

- **Claude Code** — Anthropic's CLI tool (`@anthropic-ai/claude-code`)
- **Playwright MCP** — Browser automation (`@playwright/mcp`)
- **Skills system** — Plain markdown files in `~/.claude/skills/`
- **Memory system** — Plain markdown files in `~/my-assistant/memory/`
- **CLAUDE.md** — Plain markdown, read by Claude Code on startup
- **No database, no backend, no build step** — intentionally simple

---

## Questions

Anything unclear — ask Luke. He knows this system deeply.

