# OpenClaw Workshop — Your AI Business Assistant

> **Keep this page open during the workshop.** Everything you need is here.

You are setting up a personal AI assistant that runs on YOUR computer. It learns about your business, remembers everything, and has 93 specialist skills built in.

---

## What You Are Building

| What | Description |
|---|---|
| **Your AI Assistant** | Runs locally on your computer. Knows your business. |
| **Browser Control** | Can open websites and automate tasks for you |
| **93 Skills** | Research, copywriting, sales emails, competitor analysis, and more |
| **Memory System** | Saves what it learns about you and your business |

---

## Before the Workshop — Everyone

Do these before you arrive. They take about 15 minutes.

### A) Create a Claude Account

1. Go to **claude.ai**
2. Click **"Get started"** — the easiest option is **"Continue with Google"**
3. Once signed in, go to **Settings** (click your name, bottom-left) → **Billing**
4. Upgrade to **Claude Max** ($100 USD/month)
   - This is required for Claude Code to work
   - You can cancel anytime after the workshop

**Done when:** You see "Max" next to your plan name in Settings → Billing.

---

### B) Install VS Code

**Mac:**
1. Go to **code.visualstudio.com**
2. Click **"Download for Mac"**
3. Open the downloaded .zip file
4. Drag **Visual Studio Code** into your **Applications** folder
5. Open it from Applications

**Windows:**
1. Go to **code.visualstudio.com**
2. Click **"Download for Windows"**
3. Run the installer
4. On the "Select Additional Tasks" screen: make sure **"Add to PATH"** is ticked
5. Click **Install**, then **Finish**

**Done when:** VS Code opens and you see a welcome screen.

---

### C) Install the Claude Code Extension

1. Open VS Code
2. Click the **Extensions** icon on the left sidebar (it looks like 4 small squares)
   - Or press: **Cmd+Shift+X** (Mac) / **Ctrl+Shift+X** (Windows)
3. In the search box, type: **Claude Code**
4. Find the result by **Anthropic** and click **Install**
5. A Claude icon will appear in your left sidebar — click it
6. Follow the prompts to **sign in** with your Claude account

**Done when:** You see the Claude chat panel in VS Code and you are signed in.

---

## Windows Users Only — Install Git

> **Mac users: skip this section entirely.** Git installs automatically on Mac when needed.

### Step 1 — Download and Install

1. Go to **git-scm.com/download/win**
2. The download should start automatically. If not, click **"Click here to download"**
3. Run the installer
4. Click **Next** through every screen — all default settings are fine
5. Click **Install**, then **Finish**

### Step 2 — Fix the PATH (IMPORTANT)

The installer does not always add Git to your system correctly. Do this manually:

1. Press the **Windows key** on your keyboard
2. Type: **Environment Variables**
3. Click **"Edit the system environment variables"**
4. Click the **"Environment Variables"** button at the bottom of the window
5. In the bottom section (System variables), find the row called **Path** and click it
6. Click **Edit**
7. Click **New**
8. Type exactly: **C:\Program Files\Git\cmd**
9. Click **OK**, **OK**, **OK** to close all windows

### Step 3 — Restart Your Computer

**You must restart your computer** for the changes to take effect. Do this now.

### Step 4 — Verify It Worked

1. Open VS Code
2. Open a terminal: **Terminal** menu → **New Terminal**
3. Type: `git --version`
4. You should see something like: `git version 2.43.0.windows.1`

If you still see "git is not recognized", double-check Step 2 — make sure the path is exactly right.

---

## At the Workshop — Paste This Into Claude

This is where the magic happens. Claude will set everything up for you.

1. Open **VS Code**
2. Click the **Claude icon** in the left sidebar
3. **Copy the entire prompt below** and paste it into the Claude chat
4. Press **Enter** and follow what Claude tells you

---

### The Setup Prompt — Copy Everything Below

```
I am at the OpenClaw Workshop by Selr AI. Please set up my AI Business Assistant.

Do these steps one at a time, telling me what you are doing in plain English.
Use the correct commands for my operating system (detect whether I am on Mac or Windows).

1. Download the workshop content by running:
   git clone https://github.com/luke-selrai/openclaw-workshop-kit.git ~/workshop-kit

   NOTE: On Mac, if a popup appears asking to install developer tools,
   tell me to click "Install" and wait a few minutes before continuing.

2. Create a folder called "my-assistant" in my home directory, with a "memory"
   subfolder inside it.

3. Copy these files from the downloaded workshop-kit into my-assistant:
   - workshop-kit/my-assistant/CLAUDE.md → my-assistant/CLAUDE.md
   - workshop-kit/my-assistant/memory/USER.md → my-assistant/memory/USER.md
   - workshop-kit/my-assistant/memory/SETUP.md → my-assistant/memory/SETUP.md
   - workshop-kit/my-assistant/memory/MEMORY.md → my-assistant/memory/MEMORY.md

4. Install all 93 skills: copy every folder from workshop-kit/skills/
   into ~/.claude/skills/ (create the skills directory if it does not exist).
   Do not copy SKILLS-LIST.md — only the folders.

5. When everything is done, tell me to open the folder "my-assistant" in VS Code:
   - Mac: Cmd+Shift+P → type "open folder" → navigate to my home folder → my-assistant
   - Windows: Ctrl+Shift+P → type "open folder" → navigate to C:\Users\[my username]\my-assistant

Talk to me like I am not technical. Plain English, one step at a time.
```

---

**What happens next:** Claude will download your tools, install 93 skills, and set up your workspace. This takes 1-2 minutes. When it is done, it will tell you to open a new folder.

---

## Open Your Workspace

After Claude finishes the setup above, it will tell you to open your workspace folder. Here is how:

**Mac:**
1. Press **Cmd+Shift+P**
2. Type: **open folder**
3. Navigate to your **home folder** → **my-assistant**
4. Click **Open**

**Windows:**
1. Press **Ctrl+Shift+P**
2. Type: **open folder**
3. Navigate to **C:\Users\[your username]\my-assistant**
4. Click **Open**

**Then:**
1. VS Code will reload with your new workspace
2. You will see **CLAUDE.md** and a **memory** folder in the left panel
3. Click the **Claude icon** in the sidebar
4. Type **hello** and press Enter
5. Your assistant will introduce itself, check its tools, and start asking about your business

---

## What Your Assistant Will Ask You

After opening your workspace, your assistant will ask 7 quick questions to learn about your business:

| # | Question |
|---|---|
| 1 | What is your first name? |
| 2 | What is your business called, and what do you do in one sentence? |
| 3 | Who are your customers — who do you help? |
| 4 | What is the biggest frustration or problem in your business right now? |
| 5 | What apps or tools do you use? (Gmail, Facebook, Xero, Instagram, etc.) |
| 6 | How do you prefer I communicate — casual and friendly, or professional and direct? |
| 7 | What would feel like a win for you from today? |

Your assistant saves all of this and remembers it in every future conversation.

---

## What You Can Do After Today

| Task | What to Say |
|---|---|
| Research your competitors | "Research my top 3 competitors and tell me what they do better" |
| Write a sales email | "Write a cold outreach email for [my ideal customer]" |
| Create social content | "Write me 5 LinkedIn posts about [topic]" |
| Analyse a market | "What are the trends in [my industry] right now?" |
| Plan your week | "Help me plan my most important tasks for this week" |
| Write a blog post | "Write a 1000-word blog post about [topic] for my website" |
| Check your email | "Summarise my unread emails" (requires Gmail connection) |

---

## Your 93 Skills — Quick Reference

Your assistant has 93 specialist skills installed. Here are the categories:

**Marketing & Content**
copywriting, email-sequence, email-composer, social-content, content-creator, content-marketer, ad-creative, direct-response-copy, paid-ads, social-orchestrator, avoid-ai-writing

**Research & Intelligence**
deep-research, research-analyst, competitor-alternatives, competitive-cartographer, reddit-insights, youtube-summarizer, last30days, apify-market-research, apify-competitor-intelligence, apify-content-analytics

**Strategy & Business**
brainstorming, writing-plans, systems-thinking, product-appeal-analyzer, plan-ceo-review, plan-eng-review, personal-finance-coach, tech-entrepreneur-coach-adhd, indie-monetization-strategist, ai-product, analytics-product

**AI & Automation**
ai-agents-architect, ai-engineer, agent-creator, agent-memory-systems, agent-memory-mcp, agent-tool-builder, agent-orchestration-multi-agent-optimize, autonomous-agent-patterns, orchestrator, prompt-engineer, skill-creator, mcp-builder, mcp-creator, claude-api, bot-developer, n8n-workflow-patterns, n8n-mcp-tools-expert, agentfolio

**Engineering & Development**
api-architect, code-architecture, fullstack-debugger, systematic-debugging, nextjs-app-router-expert, typescript-advanced-patterns, supabase-admin, postgresql-optimization, security-auditor, modern-auth-2026, oauth-oidc-implementer, microservices-patterns, performance-profiling, logging-observability, test-driven-development, verification-before-completion, qa, webapp-testing, playwright-skill

**DevOps & Infrastructure**
devops-automator, terraform-iac-expert, github-actions-pipeline-builder, site-reliability-engineer, vercel-deployment, git-workflow-expert, gstack-ship, using-git-worktrees, finishing-a-development-branch, cost-optimizer, task-decomposer, dispatching-parallel-agents, subagent-driven-development

**Design & UX**
shadcn-ui, web-design-guidelines, web-accessibility, diagramming-expert

**Other**
remotion-best-practices, retro, feature-manifest, sales-automator, technical-writer, first-run-setup

---

## Connect More Tools (Optional — After Setup)

These extra connections let your assistant do more. They all require Node.js — if you do not have it, your assistant can help you install it. Just ask: "Help me install Node.js"

**Gmail — Read and draft emails**
Your assistant will run: `claude mcp add gmail npx @gptscript-ai/gmail-mcp --scope user`
Then sign in with your Google account when the browser opens.

**Google Calendar — See and manage your schedule**
Your assistant will run: `claude mcp add google-calendar npx @gptscript-ai/google-calendar-mcp --scope user`
Same Google sign-in process.

**Playwright — Browser automation**
Your assistant will run: `claude mcp add playwright npx @playwright/mcp@latest --scope user`
This lets your assistant open websites and do tasks in your browser.

---

## Useful Links

| Link | What It Is |
|---|---|
| [GitHub Repo](https://github.com/luke-selrai/openclaw-workshop-kit) | Workshop source code and skills |
| [Claude.ai](https://claude.ai) | Your Claude account |
| [VS Code](https://code.visualstudio.com) | Code editor download |
| [Git for Windows](https://git-scm.com/download/win) | Windows Git download |
| [Node.js](https://nodejs.org) | Optional — needed for browser automation |
| [Selr AI](https://selrai.com.au) | Workshop by Selr AI |

---

## If Something Breaks

| Problem | Solution |
|---|---|
| "git is not recognized" (Windows) | Go back to the "Windows Users Only" section and follow the PATH fix steps |
| Skills not showing up | Close VS Code completely and reopen it. Skills load on fresh start. |
| Claude keeps asking to set up | Check that `my-assistant/memory/SETUP.md` has `setup_complete: true` |
| Claude login loop | In the Claude chat, ask it to run: `claude logout` then `claude login` |
| Playwright not connecting | Make sure Node.js is installed first (`node --version`). Then ask your assistant to reconnect it. |
| Something else | Raise your hand — your workshop leader will help! |

---

*Built by Selr AI — selrai.com.au*
