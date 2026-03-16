# Developer Notes — OpenClaw Workshop Kit

**Repo:** https://github.com/luke-selrai/openclaw-workshop-kit
**Contact:** Luke Heka — luke@selrai.com.au
**Workshop:** Tomorrow (Mar 17/19), 20 non-technical business owners, 3 hours

---

## What This Is

A self-installing AI business assistant kit. Non-technical business owners:
1. Install VS Code + Claude Code extension (done before workshop)
2. Run ONE command in the terminal
3. An AI agent takes over and sets everything else up autonomously — using browser automation (Playwright) to open websites, click through signups, guide through API keys, etc.
4. They sit and watch/approve

---

## Repo Structure

```
openclaw-workshop-kit/
├── CLAUDE.md                        # AI assistant instructions (root version)
├── setup.sh                         # One-command installer
├── README.md                        # End-user quickstart
│
├── my-assistant/                    # THIS is what gets copied to ~/my-assistant/
│   ├── CLAUDE.md                    # AI agent brain — 3-phase setup wizard
│   ├── .mcp.json                    # Auto-activates Playwright on folder open
│   └── memory/
│       ├── USER.md                  # Onboarding placeholder (status: not-yet-onboarded)
│       └── SETUP.md                 # Setup status tracker
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

When an attendee runs the install command:

```bash
git clone https://github.com/luke-selrai/openclaw-workshop-kit.git ~/workshop-kit && cd ~/workshop-kit && bash setup.sh && cd ~/my-assistant && claude
```

1. `setup.sh` installs Node.js, Claude Code, copies skills, sets up memory files
2. `cd ~/my-assistant && claude` opens the assistant in that folder
3. Claude reads `my-assistant/CLAUDE.md` — sees setup is not complete
4. **Phase 1 (Setup):** Installs Playwright first, then uses browser automation to walk through remaining setup — GitHub, Gmail, Google Calendar, Telegram
5. **Phase 2 (Onboarding):** Asks 7 questions about their business, saves to `~/my-assistant/memory/USER.md`
6. **Phase 3 (Demo):** Runs a live demo task matched to their stated business challenge

**Key design decision:** Playwright (browser automation) goes in FIRST. Once that's connected, the agent can drive the browser to handle everything else — open OAuth consent screens, navigate to settings pages, etc. The user just watches and approves.

---

## What Needs Work (Priority Order)

### HIGH — Test the full install flow

The most important thing is a clean end-to-end test:
1. On a fresh Mac (or a new Mac user account) — not a developer machine
2. Run the single install command
3. Does setup.sh complete without errors?
4. Does `cd ~/my-assistant && claude` open correctly?
5. Does the Playwright install step work?
6. Does onboarding save to the right path?

**Known potential issues:**
- `git clone` may trigger Xcode popup on fresh Mac — setup.sh warns about this but test it
- Playwright MCP install command: `claude mcp add playwright npx @playwright/mcp@latest --scope user` — verify this is the correct syntax for the current Claude Code version
- The `.mcp.json` in `my-assistant/` — verify Claude Code picks this up automatically when you `cd` into that folder
- `~/.claude/skills/` path — verify setup.sh copies skills here correctly

### HIGH — Windows support

Currently setup.sh works on Mac/Linux. Windows users need:
- Different install commands (no Homebrew, different Node.js install)
- PowerShell vs bash differences
- Create `docs/WINDOWS-SETUP.md` with step-by-step Windows instructions
- OR add Windows detection to setup.sh with alternative paths

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

This is the beauty of GitHub — attendees can always pull updates:

```bash
cd ~/workshop-kit && git pull origin main && bash setup.sh
```

Running `setup.sh` again is safe — it skips anything already installed.

For pushing updates to everyone: just commit to `main`. Next time they pull, they get everything new.

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

