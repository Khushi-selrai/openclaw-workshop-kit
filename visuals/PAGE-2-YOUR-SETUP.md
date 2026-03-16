# PAGE 2 — Your Setup: How Everything Connects

---

## The Big Picture

Think of your AI setup like a kitchen:

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                   │
│   YOUR COMPUTER                                                  │
│   ─────────────────────────────────────────────────────────    │
│                                                                   │
│   ┌──────────────┐     ┌──────────────┐     ┌──────────────┐   │
│   │   VS CODE    │     │   TERMINAL   │     │   BROWSER    │   │
│   │              │     │              │     │              │   │
│   │ Your editor  │     │ The command  │     │ Chrome/Safari│   │
│   │ (where you   │────▶│ line where   │     │              │   │
│   │ see files    │     │ Claude runs  │     │ Claude can   │   │
│   │ and chat)    │     │              │────▶│ control this │   │
│   └──────────────┘     └──────────────┘     └──────────────┘   │
│          │                    │                                   │
│          │                    │                                   │
│          ▼                    ▼                                   │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │                   CLAUDE CODE                            │   │
│   │              (Your AI Assistant)                         │   │
│   │                                                          │   │
│   │  Reads your CLAUDE.md (its instructions)                │   │
│   │  Uses your Skills (its abilities)                        │   │
│   │  Connects to your apps via MCP tools                    │   │
│   │  Stores memory about you                                 │   │
│   └─────────────────────────────────────────────────────────┘   │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## What Each Part Does

### VS Code (Visual Studio Code)
Your "workspace" — like a smart notepad where you can see all your files, chat with Claude, and watch it work. It's free and made by Microsoft.

> **Analogy:** VS Code is like your office desk. It's where you sit and work. Claude Code is the brilliant assistant sitting across from you.

### Terminal
A text-based window where you type commands. Looks scary, but you'll only ever need a few commands. Claude Code runs here.

> **Analogy:** The terminal is like a phone call to your computer. Instead of clicking icons, you type instructions. Claude handles all the complex commands for you.

### CLAUDE.md (Your Instructions File)
A file that tells Claude who you are, how to talk to you, and what it can do. Like a personalised employee handbook for your AI.

> **Analogy:** Like an instruction manual you wrote for a new employee — your preferences, your business context, how you like things done.

### Skills
Mini-programs that give Claude special abilities. Each skill is a folder with instructions for doing a specific job really well.

> **Analogy:** Like hiring a specialist. Your regular assistant is smart, but when you need expert copywriting, they pull out the "copywriting specialist" manual and follow it precisely.

### MCP Tools (Model Context Protocol)
Connections between Claude and other apps. Lets Claude read your emails, control your browser, or talk to your calendar.

> **Analogy:** MCP tools are like giving your assistant keys to different rooms — the email room, the browser room, the calendar room.

---

## Your File Structure

```
YOUR COMPUTER
│
├── my-assistant/
│   └── CLAUDE.md              ← Claude's instructions (who you are, how to help you)
│
├── workshop-kit/
│   ├── setup.sh               ← The installer that set everything up
│   ├── skills/                ← Your skill files
│   └── docs/                  ← This guide and references
│
└── .claude/
    ├── skills/                ← All your installed skills (Claude can read these)
    └── projects/
        └── my-assistant/
            └── memory/
                └── USER.md    ← Your personal memory file (name, business, preferences)
```

---

## How a Conversation Works

```
You type a message
        │
        ▼
Claude reads your CLAUDE.md (your instructions + who you are)
        │
        ▼
Claude reads your memory file (remembers your business & preferences)
        │
        ▼
Claude decides which skill to use (e.g. "copywriting" for writing tasks)
        │
        ▼
Claude does the work (research, writing, automation, etc.)
        │
        ▼
Claude responds to you in your preferred style
        │
        ▼
If it learned something new about you → updates your memory file
```

---

## The 3 Commands You Need to Know

```bash
# Start your AI assistant
cd ~/my-assistant && claude

# Check what tools are connected
claude mcp list

# Install a new tool
claude mcp add [tool-name] [install-command]
```

That's it. Claude handles everything else.

---

*OpenClaw Workshop — selrai.com.au*
