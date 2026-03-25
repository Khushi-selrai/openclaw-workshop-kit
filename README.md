# OpenClaw Workshop — AI Business Assistant Kit

**Built by Selr AI — [selrai.com.au](https://selrai.com.au)**

> Give your business an AI assistant that remembers who you are, learns your business, and gets smarter every time you use it — without writing a single line of code.

---

## What Is This?

This kit sets up a personal AI business assistant on your laptop. Not a chatbot you close and forget — an assistant that:

- **Remembers your business** — your name, your customers, your biggest challenges
- **Lives on your computer** — runs locally, not in a browser tab
- **Controls your browser** — can open websites, fill forms, and do research for you
- **Has 94 specialist skills** — research, copywriting, sales emails, social content, competitor analysis, and more
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
              ├── skills/ (94 specialist skills)
              └── Playwright (browser remote control)
```

**Two steps, then you are up and running:**

| Step | What Happens |
|---|---|
| **1. Bootstrap** | Paste the bootstrap prompt into Claude Code — it clones the repo, copies skills, and creates your workspace |
| **2. Open workspace** | Open `~/my-assistant/` in VS Code and start Claude Code — the CLAUDE.md agent handles onboarding, asks 7 questions about your business, and runs a live demo |

After that, every time you open VS Code and type `claude`, your assistant already knows who you are.

---

## Quick Start

**Before the workshop**, complete these 3 steps — takes about 15 minutes:

1. Get a **Claude Max** subscription at [claude.ai](https://claude.ai) ($100 USD/month)
2. Install **VS Code** at [code.visualstudio.com](https://code.visualstudio.com)
3. Install the **Claude Code extension** inside VS Code (search "Claude Code" in Extensions)

**Windows users:** also install [Git for Windows](https://gitforwindows.org) — see [docs/WINDOWS-SETUP.md](docs/WINDOWS-SETUP.md) before arriving.

No other pre-installs needed on Mac.

---

## At the Workshop

1. Open VS Code and start Claude Code in the terminal
2. Copy the **bootstrap prompt** from the workshop Notion page and paste it into Claude Code
3. Claude handles everything: clones the repo, copies skills, creates your workspace
4. When it finishes, open `~/my-assistant/` in VS Code and start Claude Code
5. The CLAUDE.md agent takes over — it greets you, asks about your business, and shows you what it can do

Your assistant handles it all conversationally, one step at a time. No scripts to run, no commands to memorise.

---

## Your 94 Skills

Skills are specialist capabilities your assistant can use. Think of them like switching your assistant from "general helper" to "expert copywriter", "market researcher", "DevOps engineer", or "product strategist" for a specific task.

This kit includes the full professional skill library — the same depth used to power Selr AI's infrastructure. See [docs/SKILLS-REFERENCE.md](docs/SKILLS-REFERENCE.md) for descriptions of every skill, and [docs/BOOTSTRAP.md](docs/BOOTSTRAP.md) for the version-controlled bootstrap prompt.

**Marketing & Content**

| Skill | What It Does |
|---|---|
| `copywriting` | Persuasive marketing copy for any platform |
| `humanizer` | Makes AI writing sound natural and human |
| `avoid-ai-writing` | Strips robotic AI patterns from any text |
| `content-creator` | Long-form SEO articles and blog content |
| `content-marketer` | Omnichannel content marketing strategy |
| `social-content` | Social media posts for LinkedIn, Instagram, Facebook |
| `social-orchestrator` | Multi-channel social media coordination |
| `ad-creative` | Ad headlines, copy, and creative briefs |
| `direct-response-copy` | High-converting direct response copy |
| `paid-ads` | Google, Meta, LinkedIn campaign strategy |
| `email-sequence` | Automated email campaigns and sequences |
| `email-composer` | Professional emails for any context |

**Research & Intelligence**

| Skill | What It Does |
|---|---|
| `deep-research` | Deep research on any topic |
| `research-analyst` | Competitive and market analysis with structured reports |
| `reddit-insights` | Mines Reddit for honest customer opinions |
| `competitor-alternatives` | Maps your competitive landscape |
| `competitive-cartographer` | Strategic competitive positioning |
| `apify-market-research` | Market research across Google, Amazon, reviews |
| `apify-competitor-intelligence` | Competitor strategy, pricing, ads, positioning |
| `apify-content-analytics` | Content performance and campaign ROI |
| `last30days` | Trends and sentiment from the last 30 days |
| `youtube-summarizer` | Transcripts and summaries from any YouTube video |

**Strategy & Business**

| Skill | What It Does |
|---|---|
| `brainstorming` | Structured idea generation |
| `writing-plans` | Plans complex tasks before executing |
| `systems-thinking` | Maps complex systems to find high-leverage interventions |
| `indie-monetization-strategist` | Monetisation models for solopreneurs and small teams |
| `tech-entrepreneur-coach-adhd` | Founder strategy — validation, MVP, marketing, money |
| `personal-finance-coach` | Tax optimisation, investment, cash flow |
| `product-appeal-analyzer` | Product desirability and market positioning |
| `plan-ceo-review` | CEO-mode plan review — challenge premises, expand scope |
| `plan-eng-review` | Engineering review — architecture, edge cases, test coverage |
| `ai-product` | AI product development strategy |
| `analytics-product` | Product analytics — PostHog, Mixpanel, funnels, north star |

**AI & Automation**

| Skill | What It Does |
|---|---|
| `ai-agents-architect` | Design and build autonomous AI agents |
| `ai-engineer` | Production LLM apps, RAG systems, intelligent agents |
| `agent-creator` | Create custom agents, skills, and MCP integrations |
| `agent-memory-systems` | Persistent memory architecture for agents |
| `agent-memory-mcp` | Hybrid memory systems with MCP |
| `agent-tool-builder` | Design tools for AI agents |
| `agent-orchestration-multi-agent-optimize` | Coordinate and optimise multi-agent systems |
| `autonomous-agent-patterns` | Design patterns for autonomous coding agents |
| `orchestrator` | Master coordinator — delegates to specialist skills |
| `agentfolio` | Discover and research autonomous AI agents |
| `n8n-workflow-patterns` | Proven n8n workflow architectural patterns |
| `n8n-mcp-tools-expert` | Expert guide for using n8n MCP tools |
| `prompt-engineer` | Improve AI instructions for better results |
| `skill-creator` | Create and improve Claude skills |
| `mcp-builder` | Build MCP servers for Claude |
| `mcp-creator` | Production-ready MCP server development |
| `claude-api` | Build apps with the Claude API |
| `bot-developer` | Discord, Telegram, Slack bots |

**Engineering & Development**

| Skill | What It Does |
|---|---|
| `api-architect` | REST, GraphQL, gRPC API design |
| `code-architecture` | Clean architecture, hexagonal, feature-based patterns |
| `fullstack-debugger` | Next.js + Cloudflare + Supabase debugging |
| `systematic-debugging` | Root-cause analysis and fixes |
| `nextjs-app-router-expert` | Next.js 14/15 App Router, React Server Components |
| `typescript-advanced-patterns` | Advanced TypeScript for production codebases |
| `supabase-admin` | Supabase RLS, migrations, schema design |
| `postgresql-optimization` | PostgreSQL performance tuning and query optimization |
| `security-auditor` | OWASP vulnerability scanning and compliance |
| `modern-auth-2026` | Passkeys, OAuth, magic links, cross-platform auth |
| `oauth-oidc-implementer` | OAuth 2.0 and OpenID Connect implementation |
| `microservices-patterns` | Service decomposition, API gateway, saga patterns |
| `performance-profiling` | Application performance and bottleneck identification |
| `logging-observability` | Structured logging, tracing, metrics for production |
| `test-driven-development` | TDD before writing implementation code |
| `verification-before-completion` | Verify work before claiming it's done |
| `qa` | Systematic QA testing for web apps |
| `webapp-testing` | Browser-based web application testing |
| `playwright-skill` | Browser automation with Playwright |
| `feature-manifest` | Manage feature manifests for code traceability |

**DevOps & Infrastructure**

| Skill | What It Does |
|---|---|
| `devops-automator` | CI/CD, IaC, Kubernetes, deployment automation |
| `terraform-iac-expert` | Terraform and OpenTofu infrastructure as code |
| `github-actions-pipeline-builder` | Production CI/CD pipelines with GitHub Actions |
| `site-reliability-engineer` | SRE practices, deployment safety, build health |
| `vercel-deployment` | Deploy Next.js and React apps to Vercel |
| `git-workflow-expert` | Git branching, conflict resolution, monorepo patterns |
| `gstack-ship` | Ship workflow — merge, test, version, PR |
| `using-git-worktrees` | Isolated feature work with git worktrees |
| `finishing-a-development-branch` | Guide to integrate completed work cleanly |
| `cost-optimizer` | Track and optimise LLM costs across workflows |
| `task-decomposer` | Break complex problems into parallel sub-tasks |
| `dispatching-parallel-agents` | Run independent tasks simultaneously |
| `subagent-driven-development` | Execute plans with parallel specialised agents |

**Design & UX**

| Skill | What It Does |
|---|---|
| `shadcn-ui` | shadcn/ui component library patterns |
| `web-design-guidelines` | Web interface guidelines and accessibility |
| `web-accessibility` | WCAG 2.1 accessibility standards |

**Other**

| Skill | What It Does |
|---|---|
| `technical-writer` | Developer docs, API references, runbooks |
| `diagramming-expert` | ASCII art and text-based diagrams |
| `retro` | Engineering retrospectives with code quality metrics |
| `personal-finance-coach` | Tax, investment, cash flow coaching |
| `remotion-best-practices` | Video creation with Remotion (React-based video) |

---

## What's In This Kit

```text
workshop-kit/
├── my-assistant/                # Copied to ~/my-assistant/ on your computer
│   ├── CLAUDE.md                # Your assistant's brain — instructions + onboarding agent
│   └── memory/                  # Where your assistant saves what it learns
│       ├── USER.md              # Your profile (filled in on first run)
│       ├── SETUP.md             # Setup completion status
│       └── MEMORY.md            # Persistent memory across conversations
├── whatsapp-channel/            # Optional WhatsApp integration (can use alongside Telegram)
│   └── src/                    # QR-code login, two-way messaging, permission relay
├── skills/                      # 94 skills (installed to ~/.claude/skills/)
├── docs/
│   ├── BOOTSTRAP.md             # Version-controlled copy of the bootstrap prompt
│   ├── WINDOWS-SETUP.md         # Step-by-step Windows guide
│   ├── COMPLETION-GUIDE.md      # What to do after the workshop
│   ├── SKILLS-REFERENCE.md      # How to use each skill
│   ├── FIRST-5-PROMPTS.md       # Copy-paste prompts to get started
│   ├── ACCOUNTS-AND-LOGINS.md   # Every account to create (with links)
│   ├── SUBSCRIPTIONS-AND-SOFTWARE.md  # What costs what
│   └── GLOSSARY.md              # Plain English definitions of every tech term
└── visuals/                     # Printable explainer pages (4 pages, PNG + MD)
```

---

## After the Workshop

Your assistant is now yours. A few things to explore next:

- **Create all accounts** — see [docs/ACCOUNTS-AND-LOGINS.md](docs/ACCOUNTS-AND-LOGINS.md)
- **Add Google Workspace (Gmail + Calendar + Drive)** — ask your assistant: "Help me connect Google Workspace"
- **Add Telegram and/or WhatsApp** (get phone notifications when tasks finish) — see [docs/COMPLETION-GUIDE.md](docs/COMPLETION-GUIDE.md)
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
Your assistant will notice and offer to fix it. Just open `~/my-assistant/` in VS Code, start Claude Code, and it will pick up where you left off.

**Can I use this on Windows?**
Yes. See [docs/WINDOWS-SETUP.md](docs/WINDOWS-SETUP.md) for the complete Windows walkthrough.

**I am a developer — how do I customise this?**
See [DEVELOPER.md](DEVELOPER.md).

---

## Support

- Workshop guides: [`docs/`](docs/)
- Windows guide: [`docs/WINDOWS-SETUP.md`](docs/WINDOWS-SETUP.md)
- Selr AI: [selrai.com.au](https://selrai.com.au)
---

OpenClaw Workshop Kit — Built by Selr AI
