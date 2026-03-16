#!/bin/bash
# ============================================================
#  OpenClaw Workshop — AI Business Assistant Setup
#  selrai.com.au
# ============================================================

set -e

SKILLS_DIR="$HOME/.claude/skills"
MEMORY_DIR="$HOME/.claude/projects/my-assistant/memory"
WORKSHOP_DIR="$HOME/workshop-kit"
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
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
  OS="windows"
  print_ok "You're on Windows"
fi

# Check Node.js
if command -v node &>/dev/null; then
  NODE_VER=$(node --version)
  print_ok "Node.js is installed ($NODE_VER)"
else
  print_warn "Node.js not found — installing now..."
  if [[ "$OS" == "mac" ]]; then
    if command -v brew &>/dev/null; then
      brew install node
    else
      print_info "Installing Homebrew first (Mac package manager)..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew install node
    fi
  else
    print_err "Please install Node.js from https://nodejs.org before continuing"
    print_err "Choose the LTS version, then re-run this script"
    exit 1
  fi
  print_ok "Node.js installed"
fi

# Check Git
if command -v git &>/dev/null; then
  print_ok "Git is installed"
else
  print_warn "Git not found"
  if [[ "$OS" == "mac" ]]; then
    xcode-select --install 2>/dev/null || true
    print_ok "Triggered Git/Xcode install (follow the popup)"
  else
    print_err "Please install Git from https://git-scm.com/downloads"
    exit 1
  fi
fi

# ──────────────────────────────────────────
print_step "STEP 2 — Installing/updating Claude Code..."

if command -v claude &>/dev/null; then
  print_ok "Claude Code already installed — updating to latest..."
  npm install -g @anthropic-ai/claude-code 2>/dev/null | tail -1
else
  print_info "Installing Claude Code (this may take 1-2 minutes)..."
  npm install -g @anthropic-ai/claude-code
  print_ok "Claude Code installed"
fi

# ──────────────────────────────────────────
print_step "STEP 3 — Setting up your skills directory..."

mkdir -p "$SKILLS_DIR"
print_ok "Skills directory ready: $SKILLS_DIR"

# ──────────────────────────────────────────
print_step "STEP 4 — Installing your business skills..."

SKILLS_TO_INSTALL=(
  "humanizer"
  "deep-research"
  "copywriting"
  "email-sequence"
  "social-content"
  "content-creator"
  "sales-automator"
  "brainstorming"
  "youtube-summarizer"
  "reddit-insights"
  "competitor-alternatives"
  "systematic-debugging"
  "writing-plans"
  "avoid-ai-writing"
  "research-analyst"
  "prompt-engineer"
)

INSTALLED=0
SKIPPED=0

for skill in "${SKILLS_TO_INSTALL[@]}"; do
  SRC="$WORKSHOP_DIR/skills/$skill"
  DST="$SKILLS_DIR/$skill"
  if [ -e "$DST" ]; then
    SKIPPED=$((SKIPPED + 1))
  elif [ -d "$SRC" ]; then
    cp -r "$SRC" "$DST"
    INSTALLED=$((INSTALLED + 1))
    print_ok "Installed skill: $skill"
  else
    print_warn "Skill not found in kit: $skill (skipping)"
  fi
done

print_ok "Skills: $INSTALLED new installed, $SKIPPED already existed"

# ──────────────────────────────────────────
print_step "STEP 5 — Setting up your memory system..."

mkdir -p "$MEMORY_DIR"

# Create memory file if it doesn't exist
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
  print_ok "Memory system ready — your assistant will ask you about your business on first run"
else
  print_ok "Memory system already set up"
fi

# Copy MEMORY index file
if [ ! -f "$MEMORY_DIR/MEMORY.md" ]; then
  cat > "$MEMORY_DIR/MEMORY.md" << 'MEMEOF'
# My AI Assistant Memory

## Files
- `USER.md` — Who I am, my business, communication preferences

MEMEOF
fi

# ──────────────────────────────────────────
print_step "STEP 6 — Installing your AI assistant settings (CLAUDE.md)..."

CLAUDE_MD_DST="$HOME/my-assistant/CLAUDE.md"
mkdir -p "$HOME/my-assistant"

if [ -f "$WORKSHOP_DIR/CLAUDE.md" ]; then
  cp "$WORKSHOP_DIR/CLAUDE.md" "$CLAUDE_MD_DST"
  print_ok "Assistant settings installed at: $CLAUDE_MD_DST"
else
  print_warn "CLAUDE.md not found in workshop kit — skipping"
fi

# ──────────────────────────────────────────
print_step "STEP 7 — Connecting browser automation..."

print_info "This gives your assistant the ability to control your browser"
print_info "Installing Playwright MCP..."

if claude mcp list 2>/dev/null | grep -q "playwright"; then
  print_ok "Browser automation already connected"
else
  claude mcp add playwright npx @playwright/mcp@latest 2>/dev/null && \
    print_ok "Browser automation connected ✅" || \
    print_warn "Browser automation install failed — run manually: claude mcp add playwright npx @playwright/mcp@latest"
fi

# ──────────────────────────────────────────
print_step "STEP 8 — All done! 🎉"

echo ""
echo -e "${GREEN}${BOLD}Your AI Business Assistant is ready!${NC}"
echo ""
echo -e "  📁 Skills installed: $((INSTALLED + SKIPPED)) skills"
echo -e "  🧠 Memory system: ready"
echo -e "  🌐 Browser automation: connected"
echo ""
echo -e "${BOLD}To start your assistant, run:${NC}"
echo ""
echo -e "  ${BLUE}cd ~/my-assistant && claude${NC}"
echo ""
echo -e "Your assistant will greet you, ask about your business,"
echo -e "and remember everything for next time."
echo ""
echo -e "📚 Full guide: ~/workshop-kit/docs/COMPLETION-GUIDE.md"
echo -e "📖 Skills reference: ~/workshop-kit/docs/SKILLS-REFERENCE.md"
echo ""
echo -e "${BLUE}Built by Selr AI — selrai.com.au${NC}"
echo ""
