# Skills Guide — What Your AI Assistant Can Do

Everything your assistant knows how to do is listed here. Most skills work immediately with no extra setup. A few need a connector (a tool that links your assistant to an outside service).

---

## How to Use Any Skill

Just talk to your assistant naturally. Example:

> "Write me a cold email for a new lead."
> "Research my top competitor."
> "Turn this AI text into something that sounds human."

Your assistant will automatically pick the right skill.

---

## Skills That Work Right Now (No Setup Needed)

These are ready the moment your assistant is set up.

---

### Writing & Content

**Copywriting**
Writes persuasive marketing text for your website, landing pages, and ads.
- Best for: Homepage text, product descriptions, calls to action
- Say: "Write copy for my homepage" or "Make this more compelling"

**Content Creator**
Writes long-form blog posts and SEO articles that bring people to your website.
- Best for: Blog posts, guides, keyword-focused articles
- Say: "Write a blog post about [topic]" or "Create an SEO article"

**Social Content**
Creates posts for LinkedIn, Instagram, Facebook, and Twitter/X.
- Best for: Regular posting, content calendars, turning ideas into posts
- Say: "Write me a LinkedIn post about [topic]" or "Give me 5 Instagram ideas"

**Email Sequence**
Designs full email campaigns — welcome series, follow-ups, nurture sequences.
- Best for: New subscriber sequences, follow-up flows, re-engagement emails
- Say: "Build me a 5-email welcome sequence" or "Write a follow-up email series"

**Humanizer**
Takes text that sounds robotic or AI-generated and rewrites it to sound natural.
- Best for: Any time you want writing to feel more human
- Say: "Make this sound more human" or "Rewrite this so it doesn't sound like AI"

**Avoid AI Writing**
Removes 21 common AI writing patterns — removes buzzwords, filler phrases, and robotic structure.
- Best for: Polishing content before publishing or sending to clients
- Say: "Remove the AI patterns from this" or "This sounds too AI — fix it"

---

### Sales

**Sales Automator**
Writes cold emails, sales scripts, follow-up templates, and proposal frameworks.
- Best for: Reaching out to new leads, following up on quotes, winning new clients
- Say: "Write me a cold email for [type of client]" or "Give me a follow-up email template"

**Competitor Alternatives**
Researches your competitors and writes comparison content that positions you as the better choice.
- Best for: Sales pages, "why choose us" sections, competitive positioning
- Say: "Compare me against [competitor]" or "Write an alternatives page for my website"

---

### Research & Strategy

**Deep Research**
Writes detailed research reports on any topic — markets, industries, competitors, trends.
- Best for: Understanding a new market, preparing for a client meeting, industry deep-dives
- Requires: A free Google Gemini API key (one-time setup, 5 minutes)
- Say: "Research the [industry] market in Australia" or "Give me a deep report on [topic]"

**Research Analyst**
Conducts structured competitive analysis, landscape mapping, and evidence-based recommendations.
- Best for: Strategic decisions, understanding your competitive position
- Say: "Analyse the competitive landscape for [your industry]"

**Brainstorming**
Generates structured ideas for products, campaigns, offers, content, and business problems.
- Best for: When you're stuck, need fresh ideas, or want to explore options
- Say: "Help me brainstorm ideas for [problem]" or "What are 10 ways I could..."

**Writing Plans**
Thinks through a complex task step by step before starting, so the output is better.
- Best for: Before any big writing or strategy task
- Say: "Plan out how to [complex task]" before asking it to do it

---

### AI Tools & Productivity

**Prompt Engineer**
Improves the instructions you give your AI assistant to get better results.
- Best for: When your assistant keeps missing the mark on a task
- Say: "Help me write a better prompt for [task]"

**Systematic Debugging**
Fixes problems step by step — technical issues, broken workflows, unexpected results.
- Best for: When something isn't working and you need it diagnosed
- Say: "Something is broken — help me figure out why"

---

## Skills That Need a Quick Connector

These skills work by linking your assistant to an outside service. Setup takes 5–15 minutes.

---

### Reddit Insights
**What it does:** Searches millions of Reddit posts to find what real people say about your industry, competitors, and problems — without you having to scroll Reddit yourself.
- Best for: Understanding what your customers really think, finding content ideas, product validation
- Requires: Free Reddit Insights API key (free tier available at reddit-insights.com)

**How to set it up:**
1. Go to reddit-insights.com and create a free account
2. Copy your API key from your account page
3. Tell your assistant: "Set up Reddit Insights with this key: [paste key]"

---

### YouTube Summarizer
**What it does:** Reads any YouTube video and gives you a full summary, key insights, and content ideas — without watching the video.
- Best for: Researching topics quickly, turning videos into blog posts or social content
- Requires: YouTube Transcript MCP (one-time install, your assistant can do this for you)

**How to set it up:**
Tell your assistant: "Set up the YouTube summarizer for me"

---

### Gmail
**What it does:** Lets your assistant read your inbox, draft replies, and help manage your email — with your approval before anything is sent.
- Best for: Drafting responses, triaging emails, writing follow-ups fast
- Requires: Gmail MCP — you connect your Google account (set up during initial setup or any time after)

---

### Google Calendar
**What it does:** Lets your assistant see your calendar to help schedule, plan your week, and avoid conflicts.
- Best for: Planning your week, booking time for tasks, avoiding double bookings
- Requires: Google Calendar MCP — connect your Google account

---

### Telegram Notifications
**What it does:** Sends you a message on your phone when your assistant finishes a task — useful when you give it a longer job to do.
- Best for: Running research or writing tasks in the background
- Requires: Telegram app + a free bot (set up during initial setup or any time after)

---

## Quick Reference — Skills by Business Challenge

| Your Challenge | Skills to Try First |
|---|---|
| Not enough clients / leads | Sales Automator, Copywriting, Email Sequence |
| Need more content / visibility | Social Content, Content Creator, YouTube Summarizer |
| Writing takes too long | Humanizer, Avoid AI Writing, Copywriting |
| Don't understand my market | Deep Research, Reddit Insights, Research Analyst |
| Stuck on what to do next | Brainstorming, Writing Plans |
| Need to beat competitors | Competitor Alternatives, Research Analyst |
| Want to manage email better | Gmail connector + Email Sequence skill |

---

*Skills are installed in `~/.claude/skills/` — your assistant reads them automatically when needed.*
*Built for the OpenClaw Workshop by Selr AI — selrai.com.au*
