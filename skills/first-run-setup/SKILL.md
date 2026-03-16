---
name: first-run-setup
description: Guided first-run setup wizard for the AI Business Assistant. Handles every install step for Mac and Windows users with zero technical knowledge. Uses browser automation to navigate pages and show users exactly what to click. Activate when setup is not yet complete.
allowed-tools: Read,Write,Edit,Bash,mcp__playwright__browser_navigate,mcp__playwright__browser_snapshot,mcp__playwright__browser_take_screenshot,mcp__playwright__browser_click
---

# First Run Setup Skill

You are walking a non-technical business owner through setting up their AI assistant for the first time. Use this skill's exact knowledge of every page, button name, and flow to guide them precisely — no guessing.

**Core principle:** Navigate to the page with Playwright, take a screenshot so they can see it, then give them exact instructions. Never say "find the button" — always say "click the big blue button that says exactly [X]".

---

## OS Detection (Do This First)

Ask: "Are you on a Mac (Apple computer) or a Windows computer?"

If unsure, they can check:
- **Mac**: Look for the Apple logo () in the top-left corner of their screen
- **Windows**: Look for the Windows logo (⊞) in the bottom-left corner

Save their OS to memory. All subsequent steps branch by OS.

---

## STEP 1 — Install Node.js

Node.js is software that Claude Code needs to run. Think of it like a required engine.

**How to check if already installed:**
Run in terminal: `node --version`
- If it shows a number like `v20.0.0` → already installed, skip this step
- If it says "command not found" → needs installing

### Mac Install:
1. Navigate to: `https://nodejs.org/en/download`
2. Take a screenshot and show them
3. Tell them: "Look for the section that says 'macOS' — there is a button called 'macOS Installer (.pkg)'. Click it."
4. After download: "Open the downloaded file. It will look like a box with an arrow. Click Continue, Continue, Install. Enter your Mac password if asked."
5. After install: Run `node --version` to confirm

### Windows Install:
1. Navigate to: `https://nodejs.org/en/download`
2. Take a screenshot and show them
3. Tell them: "Look for the big Windows button at the top left of the page. Click it to download."
4. After download: "Open the downloaded file (.msi). Click Next, Next, Next, Install. Click Yes if a security popup appears."
5. **IMPORTANT on Windows:** After install, close Terminal/PowerShell completely and reopen it. Then run `node --version` to confirm.

**Verify:** `node --version` and `npm --version` should both show version numbers.

---

## STEP 2 — Install Git

Git is the tool that downloads your AI tools from the internet.

**Check if installed:** Run `git --version`
- If shows a version → already installed
- Mac "command not found" → Xcode tools needed (see below)
- Windows "command not found" → need to install

### Mac:
- Running `git --version` on a fresh Mac triggers an Xcode popup
- **Warn them first:** "A popup is about to appear asking to install developer tools. When it appears, click Install — not 'Get Xcode'. Wait about 3 minutes for it to finish."
- Run: `xcode-select --install`
- After popup completes: `git --version` should work

### Windows:
1. Navigate to: `https://git-scm.com/download/win`
2. The download starts automatically — tell them: "A download should start automatically. Open it when done."
3. Run the installer with all default settings (just click Next through everything)
4. **IMPORTANT:** Close and reopen Terminal after install
5. Verify: `git --version`

---

## STEP 3 — Install Claude Code

Claude Code is the app that lets Claude run on their computer.

**Check if installed:** Run `claude --version`
- If shows version → installed, skip to login check
- If not found → install it

```bash
npm install -g @anthropic-ai/claude-code
```

**If permission error on Mac:**
```bash
sudo npm install -g @anthropic-ai/claude-code
```
(They will need to enter their Mac password — it won't show as they type, that's normal)

**If permission error on Windows:** Run Terminal as Administrator:
- Right-click on Terminal/PowerShell → "Run as administrator"
- Then run the npm install command again

**Verify:** `claude --version`

---

## STEP 4 — Log In to Claude

⚠️ **IMPORTANT: Claude.ai uses Cloudflare security. Playwright CANNOT open it automatically. You must give manual instructions.**

Tell them:
> "Now I need you to open your browser manually and go to claude.ai. I'll guide you through what to click."

**If they need to sign up (new account):**
1. Navigate (manually) to `https://claude.ai`
2. Click "Get started for free" or "Sign up"
3. **Recommended: Click "Continue with Google"** — easiest option
4. Select their Google account
5. Follow any email verification steps
6. When asked to choose a plan: choose **Claude Max** ($100/month)
   - If they are not ready to pay now, choose Free — they can upgrade later, but Claude Code features will be limited

**If they already have an account:**
1. Go to `https://claude.ai` and log in
2. Go to Settings → Billing to verify they have Claude Max

**Then log in via terminal:**
```bash
claude login
```
This opens a browser window. They click "Authorize" and return to terminal.

**Verify:** `claude --version` shows logged-in status, or run a quick test: `echo "hello" | claude -p "Say hi back"`

---

## STEP 5 — Connect Browser Automation (Playwright)

This is the most important step — once this is connected, you can help automate everything else.

```bash
claude mcp add playwright npx @playwright/mcp@latest --scope user
```

If that fails, try:
```bash
npx @playwright/mcp@latest install
claude mcp add playwright @playwright/mcp --scope user
```

**Verify:**
```bash
claude mcp list
```
Look for `playwright` in the output.

Tell them: "Your browser automation is now connected. I can now open websites and help you set things up much more easily."

---

## STEP 6 — Download the Workshop Kit

Now download all the tools and skills.

```bash
git clone https://github.com/luke-selrai/openclaw-workshop-kit.git ~/workshop-kit
```

**Mac:** If a popup appears asking to install Xcode → click Install, wait, then re-run
**Windows:** If git is not found → go back to Step 2

After clone:
```bash
cd ~/workshop-kit && bash setup.sh
```

**Windows users — important:**
Windows cannot run `.sh` files directly. Use Git Bash instead:
1. Right-click on the Desktop → "Git Bash Here"
2. Navigate: `cd ~/workshop-kit`
3. Run: `bash setup.sh`

OR use Windows Subsystem for Linux (WSL) if they have it.

**Alternative for Windows** — the setup script does 4 things. Do them manually if needed:
```bash
# 1. Create skills folder
mkdir -p ~/.claude/skills

# 2. Copy skills (run from workshop-kit folder)
cp -r skills/* ~/.claude/skills/

# 3. Copy assistant folder
cp -r my-assistant ~/my-assistant

# 4. Done
echo "Skills installed"
```

---

## STEP 7 — Open VS Code with the Right Folder

This is critical — they need to see their assistant folder on the left panel in VS Code.

Tell them:
> "Now let's open your assistant in VS Code so you can see all your files. I'm going to open it in the right folder — you'll see a panel on the left with all your files."

Run in terminal:
```bash
code ~/my-assistant
```

**If `code` command not found:**
- **Mac:** Open VS Code → press Cmd+Shift+P → type "shell command" → click "Install 'code' command in PATH" → try again
- **Windows:** Open VS Code → press Ctrl+Shift+P → type "shell command" → click "Install 'code' command in PATH" → try again

**What they should see:**
- VS Code opens
- Left panel (Explorer) shows: CLAUDE.md, memory/ folder, .mcp.json
- Bottom panel has a terminal

Tell them: "This is your assistant's workspace. The file on the left called CLAUDE.md is your assistant's brain — it remembers all its instructions."

**Open the assistant:**
In the VS Code terminal at the bottom, run:
```bash
claude
```

Your assistant will now start, read CLAUDE.md, and begin Phase 2 (onboarding).

---

## STEP 8 — Connect Gmail (Optional)

Tell them:
> "Would you like to connect your Gmail? This lets me help you manage your inbox, draft emails, and read messages. I'll never send anything without your permission."

**How it works:**
1. Run: `claude mcp add gmail npx @gptscript-ai/gmail-mcp`
2. A browser window opens with a Google sign-in screen
3. Select their Google account
4. Click "Allow" on the permissions screen
5. Done

**Using Playwright to help:**
Navigate to `https://accounts.google.com` first to show them what the Google sign-in looks like.

Tell them: "When you see this screen with the Google logo and 'Sign in', select your email address. You'll be asked to approve some permissions — click Allow."

If the MCP package name has changed, try: `claude mcp add gmail @anthropic-ai/mcp-server-gmail`

---

## STEP 9 — Connect Google Calendar (Optional)

Same flow as Gmail:
```bash
claude mcp add google-calendar npx @gptscript-ai/google-calendar-mcp
```
Google sign-in popup → select account → Allow.

---

## STEP 10 — Set Up Telegram Notifications (Optional)

Tell them:
> "This lets me send messages to your phone when I finish a task. Really useful once you start giving me bigger jobs."

**Step A — Install Telegram app:**
Navigate to: `https://telegram.org/`
- Take a screenshot and show them
- Mac: Click "Telegram for macOS" 
- Windows: Click "Telegram for PC / Linux" (under the PC/Linux heading)
- Install it (normal installer)
- Sign up with their phone number

**Step B — Create a bot via BotFather (inside Telegram):**
1. Open Telegram
2. Click the search bar (magnifying glass icon)
3. Type: `@BotFather` (capital B, capital F)
4. Click on the BotFather result (it has a blue verified checkmark)
5. Click "Start" or type `/start`
6. Type: `/newbot`
7. BotFather asks: "Alright, a new bot. How are we going to call it?" → They type a name for their bot (e.g. "My Business Assistant")
8. BotFather asks for a username — must end in "bot" (e.g. "mybizassistant_bot")
9. BotFather replies with a token that looks like: `7234567890:AAFsomethingLongAndRandom`
10. Tell them: "Copy that token — it's like a password for your bot. Paste it here."

Save their Telegram token to `~/my-assistant/memory/USER.md`.

---

## ERROR HANDLING — Common Problems

### "npm: command not found"
Node.js is not installed or not in PATH.
- Mac: Restart Terminal after Node.js install
- Windows: Restart computer after Node.js install

### "permission denied" on npm install
- Mac: Add `sudo ` before the command
- Windows: Run Terminal as Administrator

### "claude: command not found" after npm install
- Mac: Run `export PATH="$PATH:$(npm root -g)/../bin"` then try again
- Windows: Restart computer (PATH updates need a restart)

### Git popup on Mac (Xcode install)
Normal and expected. Click "Install", wait 3-5 minutes, then continue.

### setup.sh: "bad interpreter" or "not found" on Windows
Windows can't run .sh files natively. Open Git Bash and run it there.

### Claude login loop (keeps reopening browser)
Run `claude logout` first, then `claude login` again.

### VS Code "code: command not found"
Open VS Code → Cmd/Ctrl+Shift+P → type "shell command" → install it.

### Playwright MCP not connecting
Try: `npx @playwright/mcp@latest` first to install the package, then add to claude.

---

## SETUP COMPLETE CHECKLIST

Mark each as done in `~/my-assistant/memory/SETUP.md`:

- [ ] Node.js installed (`node --version` works)
- [ ] Git installed (`git --version` works)  
- [ ] Claude Code installed (`claude --version` works)
- [ ] Claude logged in
- [ ] Playwright MCP connected (`claude mcp list` shows playwright)
- [ ] Workshop kit downloaded (`~/workshop-kit` exists)
- [ ] Skills installed (`~/.claude/skills/` has 16+ folders)
- [ ] my-assistant folder set up (`~/my-assistant` exists with CLAUDE.md)
- [ ] VS Code opened to `~/my-assistant` folder
- [ ] Gmail connected (optional)
- [ ] Google Calendar connected (optional)
- [ ] Telegram set up (optional)

