# Windows Setup Guide

**For Windows users attending the OpenClaw Workshop**

This guide walks you through every step from a fresh Windows computer to a working AI Business Assistant.

---

## Before You Start

- Windows 10 or Windows 11 (64-bit)
- You need internet access
- You need administrator access to your laptop (you can install software)
- Allow about 30-40 minutes total

---

## Step 1 — Install VS Code

1. Go to: **https://code.visualstudio.com**
2. Click the big blue **Download for Windows** button
3. Run the downloaded installer (`VSCodeSetup-x64-....exe`)
4. Click through the installer — all default settings are fine
5. On the "Select Additional Tasks" screen, tick:
   - **Add "Open with Code" action to Windows Explorer file context menu**
   - **Add to PATH (requires shell restart)**
6. Click **Install**, then **Finish**
7. VS Code will open automatically

✅ Done when: VS Code opens and shows a welcome screen.

---

## Step 2 — Install the Claude Code Extension

1. In VS Code, click the **Extensions icon** on the left sidebar (looks like 4 squares, or press `Ctrl+Shift+X`)
2. In the search box, type: **Claude Code**
3. Click **Install** on the result from Anthropic
4. The Claude icon will appear in your left sidebar

✅ Done when: Claude icon appears in the VS Code left sidebar.

---

## Step 3 — Install Node.js

Node.js is required to run Claude Code in the terminal.

1. Go to: **https://nodejs.org**
2. Click the button labelled **"LTS"** (Long Term Support) — this is the stable version
3. Download the **Windows Installer (.msi)** — look for the `.msi` download, NOT the "nvm" commands
4. Run the downloaded file (`node-v20.x.x-x64.msi` or similar)
5. Click through the installer — all defaults are fine
6. On the "Tools for Native Modules" page, tick the checkbox if it appears
7. Click **Install**, then **Finish**

**Verify it worked:**
1. Close all terminal windows and open a new one: press `Windows key` → type `cmd` → press Enter
2. Type: `node --version` then press Enter
3. You should see something like `v20.11.0`

✅ Done when: `node --version` shows a version number.

> **Troubleshooting:** If `node` is not found, try restarting your computer and opening a new terminal.

---

## Step 4 — Install Git

Git is needed for Claude Code to work properly.

1. Go to: **https://git-scm.com/downloads/win**
2. Click **Click here to download** (the standalone installer)
3. Run the installer
4. Click through — all default settings are fine **except:**
   - On "Choosing the default editor used by Git" — change to **Use Visual Studio Code as Git's default editor** if you like
   - On "Adjusting your PATH environment" — keep **Git from the command line and also from 3rd-party software** selected
5. Click **Install**, then **Finish**

**Verify it worked:**
1. Open a new Command Prompt (`Windows key` → `cmd` → Enter)
2. Type: `git --version` then press Enter
3. You should see something like `git version 2.43.0.windows.1`

✅ Done when: `git --version` shows a version number.

---

## Step 5 — Install Git Bash (for running .sh scripts)

The workshop setup script (`setup.sh`) is a shell script. On Windows, you need Git Bash to run it.

Good news: **Git Bash is included with the Git installer above.** If you installed Git in Step 4, you already have it.

**To open Git Bash:**
- Press `Windows key` → type `Git Bash` → press Enter
- OR right-click on your Desktop or any folder → **Git Bash Here**

> All terminal commands in this guide that use `~/` paths should be run in **Git Bash**, not regular Command Prompt.

✅ Done when: Git Bash opens and shows a `$` prompt.

---

## Step 6 — Install Claude Code

1. Open **Git Bash** (from Step 5)
2. Type this command and press Enter:
   ```
   npm install -g @anthropic-ai/claude-code
   ```
3. Wait 1-2 minutes while it installs
4. Verify: type `claude --version` and press Enter

✅ Done when: `claude --version` shows a version number.

> **If you see a permissions error:** Try running Git Bash as Administrator.
> Right-click the Git Bash icon → **Run as administrator** → run the npm install command again.

---

## Step 7 — Log In to Claude

1. In Git Bash, type: `claude` and press Enter
2. Claude Code will ask you to log in
3. It will open a browser window — log in with your Claude Max account credentials
4. Come back to the terminal after logging in

> **Note:** Claude.ai has security checks that cannot be bypassed automatically.
> You must log in manually in the browser window that opens.

✅ Done when: Claude Code shows a prompt like `>` and you can type messages.

Press `Ctrl+C` to exit Claude for now.

---

## Step 8 — Set Up Your Workspace Folder

1. In Git Bash, run:
   ```
   mkdir -p ~/my-assistant/memory
   ```
2. Open VS Code with that folder:
   ```
   code ~/my-assistant
   ```
3. You should see VS Code open with the **Explorer panel on the left** showing your `my-assistant` folder

> **If `code` command is not found:**
> In VS Code, press `Ctrl+Shift+P`, type `shell command`, and select **"Shell Command: Install 'code' command in PATH"**.
> Then open a new Git Bash window and try again.

✅ Done when: VS Code is open showing `my-assistant` folder in the left Explorer panel.

---

## Step 9 — Run the Workshop Setup Script

The setup script installs all your skills and settings automatically.

1. In Git Bash, navigate to the workshop kit:
   ```
   cd ~/workshop-kit
   ```
2. Run the setup script:
   ```
   bash setup.sh
   ```
3. Follow the on-screen prompts — press Enter when asked

✅ Done when: You see the green "All done!" message.

---

## Step 10 — Connect Browser Automation (Playwright)

This gives your assistant the ability to control your browser and do tasks for you.

1. In Git Bash, run:
   ```
   claude mcp add playwright npx @playwright/mcp@latest
   ```
2. Confirm with `y` if prompted

✅ Done when: No error appears and the command completes.

---

## Step 11 — Start Your Assistant

1. In Git Bash, run:
   ```
   cd ~/my-assistant && claude
   ```
2. Your AI assistant will greet you and ask about your business
3. Answer its questions — it will remember everything for next time

---

## Common Windows Problems

| Problem | Fix |
|---|---|
| `npm` is not recognised | Restart Git Bash after installing Node.js |
| `claude` is not recognised | Run `npm install -g @anthropic-ai/claude-code` again, then restart Git Bash |
| `code` is not recognised | In VS Code: `Ctrl+Shift+P` → "Shell Command: Install 'code' command in PATH" |
| `bash` is not recognised | Use Git Bash — not Command Prompt or PowerShell |
| Permission denied on npm install | Run Git Bash as Administrator (right-click → Run as administrator) |
| Antivirus blocks install | Temporarily pause your antivirus, run the install, re-enable antivirus |
| Setup script fails at Playwright | Run manually: `claude mcp add playwright npx @playwright/mcp@latest` |
| Claude.ai shows "verification" | Log in manually in the browser — this is normal security, not an error |

---

## Path Reference (Windows vs Mac)

| What | Mac | Windows (Git Bash) |
|---|---|---|
| Home folder | `~/` or `/Users/yourname/` | `~/` or `C:/Users/yourname/` |
| my-assistant folder | `~/my-assistant/` | `~/my-assistant/` |
| workshop-kit folder | `~/workshop-kit/` | `~/workshop-kit/` |
| Skills folder | `~/.claude/skills/` | `~/.claude/skills/` |

> Good news: Git Bash uses the same `~/` shorthand as Mac, so most commands are identical.

---

## Need Help?

- Email: **luke@selrai.com.au**
- See also: `~/workshop-kit/docs/GLOSSARY.md` — plain English definitions of every term

---

*OpenClaw Workshop — selrai.com.au*
