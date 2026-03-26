---
title: Google Workspace Setup Guide
version: 4.0
date: 2026-03-27
---

# Google Workspace — Setup Guide

This guide walks you through connecting Google Workspace (Gmail, Calendar, Drive, Docs, Sheets, and more) to Claude Code. Once connected, you can just ask your assistant things like "send an email" or "check my calendar" — no commands needed.

---

## What You Need Before Starting

- Claude Code installed and working (follow [FULL-SETUP-PAGE.md](FULL-SETUP-PAGE.md) if not done yet)
- Node.js installed (check by typing `node --version` in the command window)
- A Google account (e.g. yourname@gmail.com or yourname@yourbusiness.com)

---

## Step 1 — Install the Google Workspace Tool

Type this in the command window and press Enter:

```
npm install -g @googleworkspace/cli
```

You should see it download and install. When it finishes, verify it worked:

```
gws --version
```

You should see a version number. If you see "command not found", close and reopen your terminal, then try again.

---

## Step 2 — Sign In to Your Google Account

Type this and press Enter:

```
gws auth login
```

A browser window will open:

1. **Select the Google account you want to use** — double-check this is the right one
2. You may see a warning that says "Google hasn't verified this app" — click **"Continue"**
3. Click **"Allow"** to give permission
4. You should see a success message in the browser

> **If `gws auth login` asks you to set up a Google Cloud project first**, run `gws auth setup` and follow the prompts — it will create the project for you automatically. Then run `gws auth login` again.

---

## Step 3 — Test It

Once signed in, test it by asking your assistant:

- "What's on my calendar today?"
- "Show me my recent emails"
- "List my recent Drive files"

Or test directly in the command window:

```
gws calendar +agenda
```

```
gws gmail messages list --max-results 5
```

Your assistant can now use Gmail, Calendar, Drive, Docs, Sheets, and more — just ask in plain English.

---

## What Your Assistant Can Do Now

| Task | What to Say |
|---|---|
| **Send an email** | "Send an email to jane@example.com about the meeting tomorrow" |
| **Read emails** | "Show me my unread emails" |
| **Check calendar** | "What meetings do I have this week?" |
| **Create a calendar event** | "Schedule a meeting with John on Friday at 2pm" |
| **Find a file** | "Find the proposal document in my Drive" |
| **Create a document** | "Create a new Google Doc called Project Plan" |
| **Work with spreadsheets** | "Open the Sales Tracker spreadsheet and add a new row" |
| **Manage tasks** | "Show me my Google Tasks" |
| **Chat** | "Send a message in Google Chat to [space name]" |

---

## Troubleshooting

| Problem | Fix |
|---|---|
| "gws: command not found" | Close and reopen your terminal. If still not found, reinstall: `npm install -g @googleworkspace/cli` |
| "Access blocked" during sign-in | Run `gws auth setup` first to create a Google Cloud project, then try `gws auth login` again |
| Wrong Google account connected | Run `gws auth logout` then `gws auth login` — select the correct account this time |
| Browser doesn't open during sign-in | Copy the URL from the command window and paste it into your browser manually |
| "Google hasn't verified this app" warning | Click **"Continue"** — this is normal for personal projects |
| Tools not responding after setup | Restart Claude Code completely — close and reopen it |

---

*Built by Selr AI — [selrai.com.au](https://selrai.com.au)*
