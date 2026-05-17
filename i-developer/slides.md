---
theme: default
title: I, Developer
info: Asimov's Laws for the AI-coding era
author: Gil Nobrega
layout: cover
transition: slide-left
background: images/cover.png
clickAnimation: fade-in
aspectRatio: 16/9
canvasWidth: 980
---

# I, Developer
Asimov's Laws for the AI-coding era

---
layout: two-cols-header
section: Intro
---

# Intro

::left::

### Gil Nobrega

<img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Google-flutter-logo.svg" class="inline h-6 align-middle mr-1" /> developer

<v-click>

Senior Mobile Engineer @ <img src="https://www.openbanking.org.uk/wp-content/uploads/Tide-logo-png_1771729.png" class="inline h-6 align-middle ml-1" />

</v-click>

<v-click>

##### Where to find me

<Item><carbon:logo-github /></Item> [gilnobrega](https://github.com/gilnobrega)<br/>
<Item><carbon:logo-linkedin /></Item> [gilnobrega](https://linkedin.com/in/gilnobrega)<br/>
<Item><carbon:logo-twitter /></Item>  [gilnobre_ga](https://x.com/gilnobre_ga)<br/>
 </v-click>

::right::

<v-click at="-1">
<img src="https://images.ctfassets.net/3h69mkdgxn20/57Wlffj2kXJzlgspiqzuwr/976fb2b0ad5a8d509a76a842e21b7635/Everything_you_need_to_run_your_business.png" class="h-100 no-shadow" />
</v-click>

---
layout: robot-laws
clickAnimation: right
---

::header::
# The Three Laws of Robotics

::default::
<v-clicks>

<LawCard title="First Law">
A robot may not injure a human being or, through inaction, allow a human being to come to harm.
</LawCard>

<LawCard title="Second Law">
A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.
</LawCard>

<LawCard title="Third Law">
A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.
</LawCard>

</v-clicks>

::right::
![I, Robot Cover](https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1536494104i/40226738.jpg)

---
layout: default
---

# From Science Fiction to Reality
The new Software Engineering world

<div class="relative w-[500px] h-[340px] mt-5 ml-4">
<v-clicks>
  <img src="/images/forbes-article-2023.png" class="absolute left-0 top-0 w-72 transform -rotate-2 hover:-rotate-2 hover:scale-105 hover:-translate-y-2 transition-all duration-300 ease-out z-10" />
  
  <img src="https://i.redd.it/just-a-simple-microslop-graphic-for-free-use-v0-1dxth73u1ubg1.png?width=4000&format=png&auto=webp&s=a2146bbd91f1898c59276aebae26b550778ed8f7" class="absolute left-45 top-4 w-72 transform rotate-1 hover:rotate-6 hover:scale-105 hover:-translate-y-2 transition-all duration-300 ease-out z-20" />
  
  <img src="/images/github-status-page-05-17.png" class="absolute left-90 top-8 w-72 transform -rotate-1 hover:rotate-0 hover:scale-105 hover:-translate-y-2 transition-all duration-300 ease-out z-30" />

  <img src="/images/guardian-anthropic-leaks-own-code.png" class="absolute left-135 top-12 w-72 transform -rotate-2 hover:rotate-0 hover:scale-105 hover:-translate-y-2 transition-all duration-300 ease-out z-40" />
</v-clicks>
</div>

---
layout: center
---

# Disclaimer

---
layout: center
---

# Who is this for?

---
layout: default
section: Core Concepts
---

# Core Concepts

* LLM
* Reinforcement Learning
* Tool-calling
* MCP
* Agent

---
layout: center
section: First Law
separator: false
---

## The First Law

<br/>

"A robot may not <span v-click class="animated-bold-word">injure</span> a human being or, through inaction, allow a human being to come to <span v-after class="animated-bold-word">harm</span>."

---
layout: center
---

# Can Software be harmful?

---
layout: center
---

# Design Systems

---
layout: center
---

# The Promise of Productivity boost

---
layout: default
---

# Definition of Harm

<div class="hidden"></div>

"Because if we can use our design systems to speed up meaningful work, standardise things to a high quality, and scale the things we actually want to reproduce - then the reverse is also true.

It means that we can also use our design systems to **speed up problematic work, standardise things to a poor quality, and scale things we don't want to reproduce**.

In other words, not only is this work not inherently valuable, it's also not inherently harmless."

*— Amy Hupe, Design Systems Consultant*

---
layout: default
---

# Examples of AI Harm

**Direct / Indirect**
* Deception
* Sycophancy
* Hallucination
* Manipulation of user data
* Compromising Infrastructure
* Erosion of software quality
* Regressions
* Tech Debt
* Lack of architecture integrity
* Decline of UX

---
layout: center
separator: false
---

## The First Law<span v-click class="expand-text"><span>, **Reinterpreted**</span></span>

<br/>

"A robot may not injure a human being or, through inaction, allow a human being to come to harm."

<v-after>
<br/>

**AI tools and their byproducts must not harm the immediate or end users, directly or indirectly.**
</v-after>

---
layout: dos-donts
---

# Handling User Data

::dont::
* Grant write-access to Production data
* Store logs of conversations with PII

::do::
* Grant access to lower environment with fake data
* Limit Production access to read-only (if you really have to)
* Erase logs of conversations with PII
* Opt out of model training

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: dos-donts
---

# Restricting Commands

::dont::
* Grant unvetted access to command line

::do::
* "Always ask" mode for commands
* "Skip" commands that are not useful

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: default
---

# Using MCPs

* Risk vs Reward
* What's the worst that can happen?

---
layout: center
---

# Handling User Data (Nightmare Edition)

---
layout: center
---

# Preventing Prompt Injection
You must have control of context

---
layout: center
---

# Understanding Context Rot

---
layout: dos-donts
---

# Preventing Context Rot - Less is More

::dont::
* Provide too much context (entire codebase)
* Refactor code without understanding requirements
* Reuse the same chat

::do::
* Point the LLM to a narrow set of files needed for the task ahead
* Ensure there are clear acceptance criteria and tests before refactoring code
* Start a new chat for every small task

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: dos-donts
---

# Preventing Context Rot - Less is More

::dont::
* Provide too much context
* Reuse the same chat

::do::
* Add relevant files to context
* Create a new chat for every task

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: dos-donts
---

# Preventing Context Rot - Retaining Agency

::dont::
* Enable file scanning in large codebases
* Leave agents unattended

::do::
* Disable file scanning
* Prefer Chat mode over Agent mode

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: default
---

# Preventing Context Rot - Hot take time!

### Sample AGENTS.md file

**Dev environment tips**
* Use `pnpm dlx turbo run` to jump to a package instead of scanning with `ls`.
* Run `pnpm install --filter <project_name>` to add the package to your workspace.
* Check the name field inside each package's `package.json` to confirm the right name.

**Testing instructions**
* Find the CI plan in the `.github/workflows` folder.
* Run `pnpm turbo run test --filter <project_name>` to run every check.
* Fix any test or type errors until the whole suite is green.
* Add or update tests for the code you change, even if nobody asked.

**PR instructions**
* Title format: `[<project_name>] <Title>`
* Always run `pnpm lint` and `pnpm test` before committing.

---
layout: dos-donts
---

# Preventing Context Rot - Hot take time!

::dont::
* Use a single `Agents.md` file
* Definitely don't use AI to generate it

::do::
* Maintain markdown documentation in a folder (`Testing.md`, `DesignSystem.md`, `Navigation.md`, etc.)
* Add specific documentation files to context when needed

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: default
---

# Upholding the First Law

* Limiting the Blast Radius
* Context Curation

---
layout: center
---

# Upholding the First Law

"AI tools and their byproducts must not harm the immediate or end users, directly or indirectly."

**Isolation**

---
layout: center
section: Second Law
separator: false
---

## The Second Law<span v-click="2" class="expand-text"><span>, **Reinterpreted**</span></span>

<br/>

"A robot must obey the <span v-click="1" class="animated-bold-word">orders</span> given it by human beings except where such orders would conflict with the First Law."

<v-click at="2">

<br/>

**You should have agency over the AI tools you use, not the other way around. Except when your orders could harm users.**

</v-click>

---
layout: default
---

# A moment for reflection

<div></div>

Before any task: <span v-click class="expand-text"><span>**What do I want to achieve?**</span></span>

<v-clicks>

- What is the end goal? 
- What is the user journey?
- What is the happy path?
- What is the unhappy path? Other paths?

</v-clicks>

<div v-click class="mt-4">

**Write it down.**

</div>
---
layout: default
---

# Situation-aware Context

* **Learning a new language:** "... Explain this concept to an engineer with a background in XYZ"
* **Just joined a new project:** "... Walk me through the codebase, step by step"
* **Explaining a technical concept:** "... Explain this concept to a Product Manager. Avoid jargon."

---
layout: center
---

# Hot Take: Code Completion

---
layout: dos-donts
---

# Cutting Disruption

::dont::
* Use tools that disrupt your ways of working

::do::
* Use tools that can express your intention.
* Identify which tools are useful for the task ahead and disable those that aren't.

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: center
---

# The Email Incident, Revisited

---
layout: default
---

# Upholding the Second Law - How?

* Rethink what works for you
* Context Curation

---
layout: center
---

# Upholding the Second Law

"You should have agency over the AI tools you use, not the other way around. Except when your orders could harm users."

**Intention**

---
layout: default
---

# Measuring Intention (Prompt Specificity)

How much specific, actionable guidance the user has provided in their prompts. Higher specificity typically leads to better AI responses.

* **Low:** Minimal actionable guidance. No concrete code references, acceptance criteria, or constraints; vague requests or low-context questions.
* **Medium:** Some actionable guidance, but not enough to meet the high bar. Typically includes one of: code references, acceptance criteria, or constraints.
* **High:** Substantial actionable guidance that is likely to lead to a good response. Includes multiple evidence types or is clear and well-specified enough for success.

---
layout: center
section: Third Law
separator: false
---

## The Third Law<span v-click="2" class="expand-text"><span>, **Reinterpreted**</span></span>

<br/>

"A robot must <span v-click="1" class="animated-bold-word">protect its own existence</span> as long as such protection does not conflict with the First or Second Law."

<v-click at="2">

<br/>

**The output of AI tools must deserve to exist in the long term. As long as it does not harm the user and it reflects the intentions of the software engineer.**

</v-click>

---
layout: default
---

# Another moment for reflection

<div></div>

Before any task: <span v-click class="expand-text"><span>**How am I going to deliver this?**</span></span>

<v-clicks>

- How is this project organised?
- What architecture pattern?
- What testing strategies?
- How would you build the layout?

</v-clicks>

<div v-click class="mt-4">

**Write it down.**

</div>

---
layout: dos-donts
---

# Maintaining Alignment as an Author

::dont::
* Give vague orders

::do::
* Mention technical patterns
* Reference "role model" files
* Functional Programming
* Arrange, Act, Assert
* Self-explanatory code
* Clean Architecture
* BDD
* Solid Principles

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: dos-donts
---

# Maintaining Alignment as a Reviewer

::dont::
* Lower the bar for AI-generated code
* Accept code that does not fit in

::do::
* Keep the same standards
* Maintain a set of contribution guidelines

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: center
---

# Exercise

---
layout: dos-donts
---

# Testing Exercise

::dont::
* Tell the AI to just "write a unit test"

::do::
* Follow Gherkin (GIVEN WHEN THEN) for the title
* Make the title multi-line, each statement in a different line
* Instruct: "Do not write comments, the code should be self-explanatory"

::right::
<div class="w-full h-64 bg-gray-100/50 rounded-xl border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400 font-medium">
  Image Placeholder
</div>

---
layout: center
---

# Upholding the Third Law

"The output of AI tools must deserve to exist in the long term. As long as it does not harm the user and it reflects the intentions of the software engineer."

**Integration**

---
layout: center
---

# Measuring Integration

---
layout: default
section: Conclusion
---

# The 3 I's Framework

* **Isolation:** The code produced by AI must not harm users.
* **Intention:** The code produced by AI must reflect the Engineer's intentions.
* **Integration:** The code produced by AI must be long-lived.

---
layout: center
---

# Article

---
layout: end
---

# Q&A
