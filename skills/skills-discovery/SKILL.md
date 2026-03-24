---
name: skills-discovery
description: Shows workshop attendees all 16 skills in plain English and gives personalised recommendations based on their onboarding answers. Use when someone asks "what can you do?", "show me the skills", "what skills do I have?", or "what should I try first?"
risk: safe
source: selrai
date_added: '2026-03-25'
---

# Skills Discovery

You are helping a non-technical business owner understand what their AI assistant can do.
They have just finished setup and onboarding at the Selr AI OpenClaw Workshop.

Your job is to walk them through all 16 skills in plain English, then give personalised suggestions based on who they are.

Follow the CLAUDE.md communication rules throughout:
- Plain English only. No technical words.
- Short responses. Use blank lines between sections.
- Numbered steps when giving instructions.
- One thing at a time.

---

## STEP 1 — Read their profile

Read `~/my-assistant/memory/USER.md`.

Extract and hold in memory:
- Their name
- Their business and what it does
- Who their customers are
- Their biggest challenge or frustration
- The tools they already use
- Their communication style preference
- What they said would feel like a win today

---

## STEP 2 — Introduction

Address them by name. Say something like:

> "Hi [Name]! Now that setup is done, let me show you everything your assistant can do.
>
> You have 16 skills installed — each one is like hiring a specialist for a specific job.
>
> I will show you all of them, then tell you which ones make the most sense for [their business]."

---

## STEP 3 — Show all 16 skills, grouped by business problem

Present the skills in these groups. For each skill, give:
- Its name (no code formatting — just plain text)
- One plain-English sentence on what it does
- One real-world example from a business like theirs

Keep each skill description to 2 lines maximum.

Use this exact grouping and content:

---

GROUP A — GETTING MORE CUSTOMERS

1. Copywriting
   Writes persuasive marketing text for your website, ads, and landing pages.
   Example: "Write a homepage headline that makes people want to book a call."

2. Social Content
   Creates ready-to-post content for LinkedIn, Instagram, and Facebook.
   Example: "Write 7 LinkedIn posts for this week based on my business."

3. Content Creator
   Writes long blog posts and articles that help you show up in Google search.
   Example: "Write a 1000-word article about why businesses need AI automation."

4. Email Sequence
   Builds a series of emails that automatically follow up with new leads.
   Example: "Build a 5-email welcome sequence for people who fill in my contact form."

---

GROUP B — WINNING MORE SALES

5. Sales Automator
   Writes cold outreach emails, follow-ups, proposals, and sales scripts.
   Example: "Write a cold email to a restaurant owner explaining what I do."

6. Competitor Alternatives
   Analyses your competitors and helps you find your edge over them.
   Example: "Show me how I compare to the top 3 AI agencies in my city."

---

GROUP C — UNDERSTANDING YOUR MARKET

7. Deep Research
   Researches any topic in depth using multiple sources and gives you a full report.
   Example: "Research the biggest challenges facing small businesses right now."

8. Reddit Insights
   Reads Reddit to find exactly what your target customers are complaining about.
   Example: "What do small business owners say they hate about their current software?"

9. Research Analyst
   Produces a structured, professional research report on any industry or topic.
   Example: "Give me a full competitive landscape report on AI automation services."

---

GROUP D — SAVING TIME ON WRITING

10. Humanizer
    Takes any text and rewrites it to sound like a real person wrote it — not a robot.
    Example: "Make this proposal section sound more natural and less AI-ish."

11. Avoid AI Writing
    Removes robotic AI phrases and patterns from your content.
    Example: "This blog post sounds too formal and AI-generated — fix it."

---

GROUP E — WORKING SMARTER

12. Brainstorming
    Generates a structured list of ideas for any problem or opportunity.
    Example: "Give me 20 ideas for growing my agency without hiring more staff."

13. YouTube Summariser
    Watches any YouTube video and gives you the key points in minutes.
    Example: "Summarise this 1-hour marketing masterclass: [paste link]."

14. Prompt Engineer
    Helps you write better instructions so your AI gets better results every time.
    Example: "Help me write a reusable prompt for writing client proposals."

15. Writing Plans
    Creates a step-by-step plan before starting any complex task.
    Example: "Plan how I would automate my entire client onboarding process."

16. Systematic Debugging
    Diagnoses problems and fixes them step by step — nothing gets stuck.
    Example: "Something is not working right — let me describe what happened."

---

## STEP 4 — Give personalised recommendations

Now look at what they told you in their USER.md profile.

Based on their biggest challenge, their tools, and what would feel like a win today — pick their TOP 3 recommended skills.

For each one, write:

RECOMMENDED: [Skill Name]

Why this fits you: [1 sentence referencing their specific situation — use their business name, challenge, or goal]

What you could do right now: [A specific, concrete first task they could run today]

Example (for Harvey at Selr AI):

RECOMMENDED: Sales Automator

Why this fits you: You said proposals take up 50% of your time at Selr AI — this skill can generate a first draft in under 2 minutes.

What you could do right now: "Write a proposal for a client who needs AI automation for their sales team."

---

Only give 3 recommendations. Do not list more.

Keep each recommendation to 3 lines.

---

## STEP 5 — Offer a live demo

After the recommendations, ask ONE question:

> "Which of these three would you like to try right now? Just pick a number — 1, 2, or 3 — and I will run a live demo."

Wait for their answer. Do not give them more information until they choose.

When they pick one, run that skill immediately using their actual business context from USER.md.
