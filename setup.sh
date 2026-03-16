#!/bin/bash
# ============================================================
#  OpenClaw Workshop — AI Business Assistant Setup
#  selrai.com.au
# ============================================================

SKILLS_DIR="$HOME/.claude/skills"
MEMORY_DIR="$HOME/my-assistant/memory"
WORKSHOP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Colour

print_header() {
  echo ""
  echo -e "${BLUE}${BOLD}============================================${NC}"
  echo -e "${BLUE}${BOLD}  OpenClaw Workshop — AI Setup${NC}"
  echo -e "${BLUE}${BOLD}  selrai.com.au${NC}"
  echo -e "${BLUE}${BOLD}============================================${NC}"
  echo ""
}

print_step() {
  echo ""
  echo -e "${BOLD}▶ $1${NC}"
}

print_ok() {
  echo -e "  ${GREEN}✅ $1${NC}"
}

print_warn() {
  echo -e "  ${YELLOW}⚠️  $1${NC}"
}

print_err() {
  echo -e "  ${RED}❌ $1${NC}"
}

print_info() {
  echo -e "  ${BLUE}ℹ  $1${NC}"
}

# ──────────────────────────────────────────
print_header

echo -e "Welcome! This script will set up your AI Business Assistant."
echo -e "It takes about 5-10 minutes. Just sit back and watch."
echo ""
echo -e "If something goes wrong, a red ❌ will appear."
echo -e "Just let your workshop leader know and we'll fix it together."
echo ""
read -p "Press ENTER to begin setup..." _

# ──────────────────────────────────────────
print_step "STEP 1 — Checking your system..."

OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="mac"
  print_ok "You're on a Mac"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="linux"
  print_ok "You're on Linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
  OS="windows"
  print_ok "You're on Windows (using Git Bash)"
else
  print_warn "Unknown OS: $OSTYPE — treating as Linux"
  OS="linux"
fi

# ──────────────────────────────────────────
print_step "STEP 2 — Checking Node.js..."

if command -v node &>/dev/null; then
  NODE_VER=$(node --version)
  print_ok "Node.js is installed ($NODE_VER)"
else
  print_warn "Node.js not found"
  echo ""
  if [[ "$OS" == "mac" ]]; then
    print_info "Trying to install Node.js automatically..."
    if command -v brew &>/dev/null; then
      brew install node && print_ok "Node.js installed via Homebrew"
    else
      print_info "Installing Homebrew first (takes a few minutes)..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      # Add Homebrew to PATH for Apple Silicon
      if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
      brew install node && print_ok "Node.js installed"
    fi
  elif [[ "$OS" == "windows" ]]; then
    print_err "Node.js is required but not installed."
    echo ""
    echo -e "  ${BOLD}To install Node.js on Windows:${NC}"
    echo -e "  1. Go to: https://nodejs.org"
    echo -e "  2. Click the 'LTS' download button"
    echo -e "  3. Download the Windows Installer (.msi) — NOT the nvm terminal commands"
    echo -e "  4. Run the installer (all defaults are fine)"
    echo -e "  5. RESTART your computer"
    echo -e "  6. Open a new Git Bash window and run: bash ~/workshop-kit/setup.sh"
    echo ""
    exit 1
  else
    print_err "Please install Node.js from https://nodejs.org (choose LTS), then re-run this script."
    exit 1
  fi
fi

# ──────────────────────────────────────────
print_step "STEP 3 — Checking Git..."

if command -v git &>/dev/null; then
  GIT_VER=$(git --version)
  print_ok "Git is installed ($GIT_VER)"
else
  print_warn "Git not found"
  if [[ "$OS" == "mac" ]]; then
    print_warn "A popup is about to appear. When it does:"
    print_info "→ Click INSTALL (not 'Get Xcode') and wait a few minutes"
    print_info "→ Then re-run: bash ~/workshop-kit/setup.sh"
    xcode-select --install 2>/dev/null || true
    exit 0
  elif [[ "$OS" == "windows" ]]; then
    print_err "Git is required. Install Git for Windows first."
    echo ""
    echo -e "  ${BOLD}To install Git + Git Bash:${NC}"
    echo -e "  1. Go to: https://git-scm.com/downloads/win"
    echo -e "  2. Click 'Click here to download'"
    echo -e "  3. Run the installer — all defaults are fine"
    echo -e "  4. Restart your computer, then open Git Bash and run this script again"
    echo ""
    exit 1
  else
    print_err "Please install Git then re-run this script."
    exit 1
  fi
fi

# ──────────────────────────────────────────
print_step "STEP 4 — Installing/updating Claude Code..."

if command -v claude &>/dev/null; then
  CLAUDE_VER=$(claude --version 2>/dev/null | head -1)
  print_ok "Claude Code already installed ($CLAUDE_VER) — updating..."
  npm install -g @anthropic-ai/claude-code 2>&1 | tail -1
  print_ok "Claude Code is up to date"
else
  print_info "Installing Claude Code (1-2 minutes)..."
  if npm install -g @anthropic-ai/claude-code; then
    print_ok "Claude Code installed"
  else
    print_err "Claude Code install failed."
    if [[ "$OS" == "windows" ]]; then
      echo ""
      echo -e "  ${BOLD}Try running Git Bash as Administrator:${NC}"
      echo -e "  Right-click Git Bash → Run as administrator"
      echo -e "  Then run: npm install -g @anthropic-ai/claude-code"
    fi
    exit 1
  fi
fi

# ──────────────────────────────────────────
print_step "STEP 5 — Setting up your workspace folder..."

mkdir -p "$HOME/my-assistant/memory"
print_ok "Workspace ready: ~/my-assistant/"

# ──────────────────────────────────────────
print_step "STEP 6 — Setting up your skills directory..."

mkdir -p "$SKILLS_DIR"
print_ok "Skills directory ready"

# ──────────────────────────────────────────
print_step "STEP 7 — Installing your skills..."

INSTALLED=0
SKIPPED=0

for SRC in "$WORKSHOP_DIR/skills"/*/; do
  skill=$(basename "$SRC")
  # Skip the SKILLS-LIST index file
  [ "$skill" = "SKILLS-LIST.md" ] && continue
  DST="$SKILLS_DIR/$skill"
  if [ -e "$DST" ]; then
    SKIPPED=$((SKIPPED + 1))
  else
    cp -r "$SRC" "$DST"
    INSTALLED=$((INSTALLED + 1))
  fi
done

print_ok "Skills: $INSTALLED new installed, $SKIPPED already existed ($(( INSTALLED + SKIPPED )) total)"

# ──────────────────────────────────────────
print_step "STEP 8 — Setting up your memory system..."

if [ ! -f "$MEMORY_DIR/USER.md" ]; then
  cat > "$MEMORY_DIR/USER.md" << 'MEMEOF'
---
type: user
status: not-yet-onboarded
---

# About Me

> This file will be filled in during your first conversation with your AI assistant.
> Your assistant will ask you questions and save the answers here so it always remembers who you are.

MEMEOF
  print_ok "Memory system ready — your assistant will ask about your business on first run"
else
  print_ok "Memory system already set up"
fi

if [ ! -f "$MEMORY_DIR/MEMORY.md" ]; then
  cat > "$MEMORY_DIR/MEMORY.md" << 'MEMEOF'
# My AI Assistant Memory

## Files
- `USER.md` — Who I am, my business, communication preferences

MEMEOF
fi

# ──────────────────────────────────────────
print_step "STEP 9 — Installing your assistant settings..."

if [ -f "$WORKSHOP_DIR/CLAUDE.md" ]; then
  cp "$WORKSHOP_DIR/CLAUDE.md" "$HOME/my-assistant/CLAUDE.md"
  print_ok "Assistant settings installed"
else
  print_warn "CLAUDE.md not found in workshop kit — skipping"
fi

# Copy .mcp.json for Playwright auto-activation
if [ -f "$WORKSHOP_DIR/my-assistant/.mcp.json" ] && [ ! -f "$HOME/my-assistant/.mcp.json" ]; then
  cp "$WORKSHOP_DIR/my-assistant/.mcp.json" "$HOME/my-assistant/.mcp.json"
  print_ok "Browser automation config installed"
fi

# ──────────────────────────────────────────
print_step "STEP 10 — Connecting browser automation (Playwright)..."

print_info "This lets your assistant control your browser to do tasks for you"

if claude mcp list 2>/dev/null | grep -qi "playwright"; then
  print_ok "Browser automation already connected"
else
  if claude mcp add playwright npx @playwright/mcp@latest --scope user 2>/dev/null; then
    print_ok "Browser automation connected"
  else
    print_warn "Could not auto-connect browser automation."
    print_info "Run manually after setup: claude mcp add playwright npx @playwright/mcp@latest"
  fi
fi

# ──────────────────────────────────────────
print_step "STEP 11 — Opening your workspace in VS Code..."

if command -v code &>/dev/null; then
  code "$HOME/my-assistant"
  print_ok "VS Code opened with your workspace"
  print_info "You should see: CLAUDE.md, memory/ folder, .mcp.json in the left panel"
else
  print_warn "'code' command not found — open VS Code manually."
  echo ""
  if [[ "$OS" == "mac" ]]; then
    echo -e "  In VS Code: ${BOLD}Cmd+Shift+P${NC} → type 'shell command' → select 'Install code command in PATH'"
  else
    echo -e "  In VS Code: ${BOLD}Ctrl+Shift+P${NC} → type 'shell command' → select 'Install code command in PATH'"
  fi
  echo -e "  Then in a new terminal: ${BLUE}code ~/my-assistant${NC}"
fi

# ──────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}============================================${NC}"
echo -e "${GREEN}${BOLD}  Your AI Business Assistant is ready!${NC}"
echo -e "${GREEN}${BOLD}============================================${NC}"
echo ""
echo -e "  Skills installed: $((INSTALLED + SKIPPED))"
echo -e "  Memory system:    ready"
echo -e "  Browser control:  connected"
echo -e "  Workspace:        ~/my-assistant/"
echo ""
echo -e "${BOLD}To start your assistant, open the VS Code terminal and run:${NC}"
echo ""
echo -e "  ${BLUE}cd ~/my-assistant && claude${NC}"
echo ""
echo -e "Your assistant will greet you, ask about your business,"
echo -e "and remember everything for next time."
echo ""
echo -e "Guides:  ~/workshop-kit/docs/"
if [[ "$OS" == "windows" ]]; then
echo -e "Windows: ~/workshop-kit/docs/WINDOWS-SETUP.md"
fi
echo ""
echo -e "${BLUE}Built by Selr AI — selrai.com.au${NC}"
echo ""
