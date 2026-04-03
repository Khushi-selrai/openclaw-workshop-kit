# Cron Tasks / Schedules / Loops — Claude Code Skill

## Overview

This skill enables Claude Code to understand, recommend, and configure automation
using Claude's built-in scheduling tools: `/schedule` and `/loop`.

When a participant asks "how do I automate this?" or "can I run this every morning?",
Claude should immediately recognise this as a scheduling use case and guide them
through the correct tool based on their setup.

---

## When to Use This Skill

Trigger this skill whenever the participant says anything like:

- "Can I automate this?"
- "I want this to run every day / every hour / every morning"
- "How do I schedule a task?"
- "Can Claude do this in the background?"
- "I don't want to manually trigger this every time"
- "How do I set up a recurring task?"

---

## Tool Comparison: Schedule vs Loop

| Feature | `/schedule` | `/loop` |
|---|---|---|
| Command | `/schedule` | `/loop` |
| Duration | Permanent | Max 7 days |
| Best for | Long-term automation | Short-term or trial runs |
| Local run | Requires computer ON | Requires computer ON |
| Cloud run | Supported (via GitHub) | Not available |
| 24/7 capable | Only on a server | No |

**Rule of thumb:**
- Use `/schedule` for anything the participant wants to keep running indefinitely
- Use `/loop` for testing automation or short campaigns (follow-ups, reminders)

---

## How to Use `/schedule`

### Step 1 — Open Claude Code terminal and run:

```
/schedule
```

### Step 2 — Describe the task in plain language when prompted:

```
Check my Gmail inbox every morning at 8am and summarise unread emails
```

### Step 3 — Claude will generate a cron expression and confirm the schedule.

### Cron Expression Reference (for advanced users):

```
* * * * *
│ │ │ │ └── Day of week (0–7, Sun=0 or 7)
│ │ │ └──── Month (1–12)
│ │ └────── Day of month (1–31)
│ └──────── Hour (0–23)
└────────── Minute (0–59)
```

**Common examples:**

```bash
# Every day at 8am
0 8 * * *

# Every Monday at 9am
0 9 * * 1

# Every hour
0 * * * *

# Every 30 minutes
*/30 * * * *
```

### Local vs Cloud Schedule

**Local** (default):
- Runs only when the computer is ON
- Suitable for workshop participants on laptops or Mac minis
- No additional setup required

**Cloud-based** (advanced):
- Runs 24/7 regardless of computer state
- Requires task to live in a GitHub repository
- Best combined with server setup from the Advanced Workshop
- Reference: https://docs.anthropic.com/en/docs/claude-code/schedule

---

## How to Use `/loop`

### Step 1 — Open Claude Code terminal and run:

```
/loop
```

### Step 2 — Describe the repeating task:

```
Every 4 hours, check if I have any new leads in my CRM and send me a summary
```

### Step 3 — Set duration when prompted (max 7 days).

**Important limitations:**
- Loops expire automatically after 7 days maximum
- No cloud option — computer must stay on
- Good for: testing, short campaigns, trial automations before committing to `/schedule`

---

## Decision Guide for Workshop Participants

```
Participant asks about automation
        │
        ▼
Is this a one-off or recurring task?
        │
   Recurring
        │
        ▼
How long do they need it to run?
        │
   ┌────┴────┐
  < 7 days  Permanent
        │         │
     /loop    /schedule
               │
               ▼
      Is their computer always on?
         ┌─────┴─────┐
        YES           NO
         │             │
   Local schedule   Server setup
   (laptop/mini)    (Advanced Workshop)
```

---

## Installing in the Workshop Kit

This skill should be referenced inside `CLAUDE.md` so the assistant automatically
recommends scheduling tools when participants ask automation questions.

### Add to CLAUDE.md (automation section):

```markdown
## Automation with Schedules and Loops

When the user asks how to automate a task, always check:
1. How often do they want it to run?
2. Do they need it to run 24/7 or only when their computer is on?

Recommend:
- `/schedule` for permanent recurring tasks (local or cloud-based)
- `/loop` for short-term or trial automation (max 7 days, local only)

For cloud-based schedules, the task must live in a GitHub repo.
For 24/7 automation, direct them toward the Advanced Workshop server setup.

Official documentation: https://docs.anthropic.com/en/docs/claude-code/schedule
```

---

## Example Prompts to Test This Skill

```
"I want Claude to check my emails every morning and summarise them"
→ Expected: Claude recommends /schedule with cron 0 8 * * *

"Can I run this lead follow-up sequence for the next 3 days?"
→ Expected: Claude recommends /loop with 3-day duration

"How do I make this run even when my laptop is closed?"
→ Expected: Claude explains server requirement + Advanced Workshop

"What's the difference between schedule and loop?"
→ Expected: Claude gives comparison table and asks about use case
```

---

## Known Limitations

- Local schedules stop when the computer sleeps or shuts down
- `/loop` maximum duration is 7 days (may vary — check latest Anthropic docs)
- Cloud schedules are limited to tasks that can run from a GitHub repo
- Claude Code must be running in the background for local schedules to fire
- No GUI for managing schedules — all done via terminal commands

---

## Official Documentation

- Schedule: https://docs.anthropic.com/en/docs/claude-code/schedule
- Loops: https://docs.anthropic.com/en/docs/claude-code/loops
- Cron Tasks Overview: https://docs.anthropic.com/en/docs/claude-code/cron-tasks

> Always reference official Anthropic docs for the latest behaviour,
> as Claude Code is updated frequently and loop durations / schedule options may change.

---

## Notes for Workshop Facilitators

- Harvey and Luke explain this verbally in every workshop — this skill bakes that
  knowledge directly into the assistant so participants get it without being asked
- Pair this with the Skill Creator skill so participants can build + schedule
  skills in one flow
- For participants on servers (Advanced Workshop), local vs cloud distinction
  becomes critical — make sure they understand the difference before setting up
  cloud schedules
