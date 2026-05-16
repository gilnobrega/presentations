---
theme: seriph
background: https://source.unsplash.com/collection/94734566/1920x1080
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## I, Developer
  Asimov’s Laws for the AI-coding era.
drawings:
  persist: false
title: I, Developer
---

# I, Developer

Asimov’s Laws for the AI-coding era

By Gil Nobrega (@gilnobre_ga)

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Press Space for next page <carbon:arrow-right class="inline"/>
  </span>
</div>

---
layout: default
---

# From Science Fiction to Reality

### The Original Laws
* **First Law:** A robot may not injure a human being or, through inaction, allow a human being to come to harm.
* **Second Law:** A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.
* **Third Law:** A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.

---
layout: center
---

# The new Software Engineering Reality

### Core Concepts
* LLM
* Reinforcement Learning
* Tool-calling
* MCP
* Agent

---
layout: default
---

# The First Law, Reinterpreted

**Original:** “A robot may not injure a human being or, through inaction, allow a human being to come to harm.”

<br>

**Reinterpreted (Isolation):** “AI tools and their byproducts must not harm the immediate or end users, directly or indirectly.”

The code produced by AI must not harm users.

---
layout: default
---

# Isolation: Handling User Data

### ❌ Don’t
* Grant write-access to Production data
* Store logs of conversations with PII

### ✅ Do
* Grant access to lower environment with fake data
* Limit Production access to read-only (if you really have to)
* Erase logs of conversations with PII
* Opt out of model training

---
layout: default
---

# Isolation: Restricting Commands

### ❌ Don’t
* Grant unvetted access to command line

### ✅ Do
* “Always ask” mode for commands
* “Skip” commands that are not useful

---
layout: default
---

# Isolation: Preventing Context Rot (Less is More)

### ❌ Don’t
* Provide too much context (entire codebase)
* Refactor code without understanding requirements
* Reuse the same chat
* Enable file scanning in large codebases
* Leave agents unattended

### ✅ Do
* Point the LLM to a narrow set of files needed for the task ahead
* Ensure there are clear acceptance criteria and tests before refactoring code
* Start a new chat for every small task
* Disable file scanning

---
layout: default
---

# The Second Law, Reinterpreted

**Original:** “A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.”

<br>

**Reinterpreted (Intention):** “You should have agency over the AI tools you use, not the other way around. Except when your orders could harm users.”

The code produced by AI must reflect the Engineer’s intentions

---
layout: default
---

# Intention: Situation-aware Context

* **Learning a new language:** “... Explain this concept to an engineer with a background in XYZ”
* **Just joined a new project:** “... Walk me through the codebase, step by step”
* **Explaining a technical concept:** “... Explain this concept to a Product Manager. Avoid jargon.”

### Cutting Disruption
* ❌ **Don't** use tools that disrupt your ways of working
* ✅ **Do** use tools that can express your intention.
* ✅ **Do** identify which tools are useful for the task ahead and disable those that aren’t

---
layout: default
---

# The Third Law, Reinterpreted

**Original:** “A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.”

<br>

**Reinterpreted (Integration):** “The output of AI tools must deserve to exist in the long term. As long as it does not harm the user and it reflects the intentions of the software engineer.”

The code produced by AI must be long-lived.

---
layout: default
---

# Integration: Maintaining Alignment

Before any task, reflect on how you will deliver it (architecture, testing, layout) and write it down.

### As an Author
* ❌ **Don’t:** Give vague orders
* ✅ **Do:** Mention technical patterns, reference “role model” files, use Functional Programming, Arrange, Act, Assert, and Clean Architecture.

### As a Reviewer
* ❌ **Don’t:** Lower the bar for AI-gen code or accept code that does not fit in.
* ✅ **Do:** Keep the same standards and maintain a set of contribution guidelines.

---
layout: center
class: text-center
---

# Summary: The 3I’s Framework

**Isolation**
The code produced by AI must not harm users.

**Intention**
The code produced by AI must reflect the Engineer’s intentions

**Integration**
The code produced by AI must be long-lived.

---
layout: end
---

# Thank You!

Q&A