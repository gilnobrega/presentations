---
theme: default
title: Debugging beyond your codebase
info: a guide on taking control of the code you don't own
author: Gil Nobrega
layout: cover
transition: slide-left
background: images/cover.png
clickAnimation: fade-in
aspectRatio: 16/9
canvasWidth: 980
---

# Debugging beyond your codebase
a guide on taking control of the code you don't own

---
layout: two-cols-header
section: Intro
---

::header::
# Intro

::left::

### Gil Nobrega

<img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Google-flutter-logo.svg" class="inline h-6 align-middle mr-1" /> developer

<v-click>

Senior Mobile Engineer @ <img src="https://www.openbanking.org.uk/wp-content/uploads/Tide-logo-png_1771729.png" class="inline h-6 align-middle ml-1" />

</v-click>

<v-click>

<Socials />

</v-click>

::right::

<v-click at="-1">
<img src="https://images.ctfassets.net/3h69mkdgxn20/57Wlffj2kXJzlgspiqzuwr/976fb2b0ad5a8d509a76a842e21b7635/Everything_you_need_to_run_your_business.png" class="h-100 no-shadow" />
</v-click>

<!--
Im Gil,
I used to be a .NET developer, now I like making apps in Flutter, I dabble in KMP sometimes.

I'm currently employed as a senior mobile engineer at Tide, a fintech that provides services to over a million small and medium businesses in Europe and Asia.
-->

---
layout: three-parts
section: Intro
part1Title: "Part 1: Debugging"
part2Title: "Part 2: Fixing"
part3Title: "Part 3: State of Flutter"
---

::header::
# Who is this for?

::part1::
- Establishing a thought process for debugging a complex bug that might live outside our direct control

::part2::
- Exploring the possible ways one could fix a bug caused by a dependency

::part3::
- as an open-source project

<!-- 
In parts 1 and 2 we're going to debug and fix a very odd bug from a couple of years ago - a time before we had access to reliable AI tools - refreshing but also scary.

Raise of hands if you've contributed to an open-source project?

Raise of hands if you've contributed to Flutter?

Part 1 might not teach anything new to those 
It's still a very interesting case study so I hope you have fun

But stick around for Part 2
-->

---
layout: default
section: "Part 1: Case Study"
---

::header::

# Flutter at scale
Pushing a framework to its limits

::body::

# 🌍  2+ million users

# 📚 4 languages

# 📱 Many devices

Comes with its own challenges

<!--
Tide is an app-first banking app.
Providing financial services to over 2+ million customers in Europe and Asia, in 4 languages and many iOS and Android devices in all shapes and forms.

When you reach this scale, you push the entire stack to its limits. The pain points of the stack you're using become your painpoints as an engineer.

A bug in a dependency cannot be swept under the rug. It becomes your bug.

A bug that cannot be replicated easily, let's say, it affects 1% of devices, in absolute terms it can still affect thousands of people. (More on that later)
-->

---
layout: default
---

::header::

# An odd bug report

::body::

First impressions are very important.

[Video goes here]

<!--

I'm part of the onboarding team, we're responsible for ensuring that we've got all necessary details before users can get their hands on financial products.

In a few words, we build the first impressions - the sign up journey, what's your name, where do you live, etc.

First impressions of an app are very important,
At this point, the loyalty of the user has not been built, and a small issue can very easily lead to the loss of a potential customer.

2 years ago, we had one of our QA engineers report this bug in our sign up page. Let's have a look:

-->

---
layout: default
---

::header::
# Debugging the Sign Up page

::body::

- Inspected state management
- Asked other engineers
- Tested on many devices

<img src="https://storage.ghost.io/c/eb/aa/ebaa2665-01a8-4415-8825-69d1f0e8fd19/content/images/2025/05/works-on-my-machine-v2-2025-jon-galloway-1.png" width="250px" />

<!--
We've tried everything to reproduce this issue
We investigated the state management of that page

We had a few text controllers that added Bloc events when they received focus and lost focus

Maybe one of them was somehow freezing the page when it lost focus?

We even asked if anyone of the other 100 engineers had experienced this, on this page, or in any other page.

Now what do you do when you can't reproduce a bug that was reported once and never again?

Maybe it is a hardware issue? The QA is able to reproduce it semi-consistently in 1 device.

-->

---
layout: center
---

# A shy bug

<!--
A few days later our technical leader happened to be testing another unrelated feature, and, while he was signing up, he managed to reproduce the issue.

I was very interested in learning how, and called him and asked him to share his screen
He tried over and over again for a good 5 minutes, focusing in and out of the fields, with no success of reproducing it.

But now we know that it can affect other users.
Our hardware theory is debunked.
But we know that we've only been able to reproduce it in Android
-->

---
layout: center
---

# Codename: Weird Stretchy Bug

---
layout: default
---

::header::

# What do we know?

::body::
- Only reproduced in Android (so far?)
- Every custom widget are stateless
- Stateful widgets come from Design System
- Therefore Design System must be to blame?

(insert image splitting the page into components)

<!--
So what do we know about the Sign Up page?

Every widget that is unique to this page is stateless.

The form template comes from the Design System.

So maybe that's where the issue lives?

In case you didn't know, Daan's the Engineering Manager for our Design System at Tide. 
We really wanted to blame his team for it, make this bug someone else's issue.
-->

---
layout: two-cols-header
---

::header::

# Debugging the Design System

Another dead end?

::left::

iOS loading animation

::right::

Android loading animation

<!--
We debugged the design system library and we didn't find any indication that forms had anything to do with rendering the rest of the page, or any custom scroll animation.

In order to feel "native", the design system uses a few platform-like components, and what I mean by this is that 

We've inspected recent changes to the design system library. And one thing stood out. The bug was first reported around the time the design system switched from using Material 2 widgets to Material 3 widgets in Android.
-->

---
layout: two-cols-header
---

::header::
# A new suspect

::left::

Material 2 scroll animation

GlowingOverscrollIndicator

<img src="https://i.sstatic.net/LG8iP.gif" />

::right::

Material 3 scroll animation

StretchingOverscrollIndicator

<!--
What is an overscroll indicator?
As the user scrolls down a page, it is good UX to let the user know they have reached the end of the scrollable content.

This is often done through visual cues.

Material 2's scroll animation showed ripples when you reached the end of the page

Whereas Material 3's stretched the page as you reached the end of the page

This stretching animation matched the bug that we saw after losing keyboard focus.

Could this be where our issue lives?
-->

---
layout: default
---

::header::
# Climbing the dependency tree
Or the dependency onion?

::body::

<DependencyOnion :clicks="$clicks" />
<v-click at="1"></v-click>
<v-click at="2"></v-click>
<v-click at="3"></v-click>
<v-click at="4"></v-click>

<!--
While we're talking about our thought process when debugging a very specific bug, there is something that applies to all bugs here

We need to start at the outer shell first, debug it thoroughly and rule it out, moving our way into the core

As a feature developer, your expertise lies in the outer shell.

And one thing we need to accept is that debugging becomes harder as the code becomes more alien to us, the effort for debugging and fixing code increases as we go down the dependency tree.
-->

---
layout: default
---

::header::
# Rule 0

::body::
Ensure debugging is enabled for out-of-workspace dependencies

---
layout: default
---

::header::
## Understanding StretchingOverscrollIndicator

::body::

<<< @/snippets/stretching_overscroll_indicator.dart dart

<!--
We think we found our smoking gun

Let's have a look at the implementation of StretchingOverscrollIndicator back then
https://github.com/gilnobrega/flutter/blob/4a65a76279cda479d0c8a2a57ac8f34890e1adf2/packages/flutter/lib/src/widgets/overscroll_indicator.dart#L783

Its implementation has a stretching transformation, this is expected (line 783)

It is driven by a _StretchController

It has two methods: 
- `absorbImpact` when the overscroll is caused by an event (scroll notification) (closing the keyboard)
- `pull` when the overscroll is caused by the user actively dragging the viewport

This was the most difficult part of this exercise
Digesting code that's "foreign" to me 

But when things clicked and I knew where to look for, it was easy to find the culprit

Let's have a look at `absorbImpact`
It takes two inputs - velocity and totalOverscroll
If velocity is smaller than 1, then it floors at 1
If velocity is larger than 1000 then it has a ceiling at 1000

There is a bit of noise here,
At first I thought that the issue would be with the end state of the animation, but this proved to be a distraction.

As I digested the code, it clicked
The animation duration is directly dependent on the velocity
If the velocity is smaller than 25, then it rounds to 0ms

What is a 0ms animation?
Does an animation with 0ms make sense?

What Flutter should do with a 0ms animation is another question, and we could debate all night about this.

But if we focus at this specific problem
If there is a scroll event that leads to overscroll, and we know that there is a requirement to have an animation
Then this animation must not be 0ms, otherwise it would not be an animation at all!

Present one line fix

But how can we be sure that this could be causing the issue?

How can we be so sure that it's not the way our own project is implemented that's causing the issue? That no other dependency or implementation is interfering with it?
-->

---
layout: two-cols-header
rightRatio: 0.3
---

::header::
# Minimal Reproducible Code

::left::
<<< @/snippets/minimal_reproducible_code.dart dart

::right::

<v-switch transition="cross-fade" unmount class="v-switch-crossfade">
  <template #1>
    <SlidevVideo v-click="+1" autoplay controls class="h-full" autoreset="click">
      <source src="/images/minimal-reproducible-code-issue.mov" />
    </SlidevVideo>

  </template>

  <template #2>
    <SlidevVideo v-click="+1" autoplay controls class="h-full" autoreset="click">
      <source src="/images/minimal-reproducible-code-fixed.mov" />
    </SlidevVideo>
  </template>
</v-switch>

<!--
The answer to this is to go back to a blank slate, start a new flutter app with no dependencies but the dependency you're trying to debug

To reproduce the bug with fewest lines as possible, in a fresh flutter app

It doesn't need to be smart, it doesn't need to be clean code, it just needs to do its task - reproduce the bug easily.

And for that, one needs to understand all of the variables involved.

One of them is screen height.
Another one of them is keyboard height.
Another one is text scale.
Another one is content height.

And what we want to manipulate for our bug is velocity, we want to reach a low velocity on "impact" (programatic scrolling to the bottom)

One way to achieve that is by making the page scrollable by just a tiny bit when the keyboard is open, (changing keyboard height, text scale, etc.)

And when the keyboard is dismissed programatically, it will aborb the impact of a very small transition from scrollable to non-scrollable, leading to a small velocity.

(Show demo on the right)

After setting the duration to a non zero amount, this can no longer be reproduced.

(Show second demo with fix)

So now we can be fairly confident that this was the root of our bug.

And after asking the QA engineer to test a build with this fix, they were not able to reproduce the bug anymore

Ok so now we found our issue, we know how to fix it
How do we actually fix it?
-->

---
layout: two-cols-header
---
::header::

# Getting creative
Multiple ways to solve a problem

::left::

(Example gif showing low drag, and a lot of drag)

::right::

<<< @/snippets/stretching_animation_test.dart dart

<!--
But there isn't just one way to make a hard to reproduce bug more easily reproducible

Sometimes you need to get more creative 

Later when I was writing a regression test I realised that another way to reduce velocity is by increasing drag

(Explain what drag is and show examples)

And this is another way to make sure your bug fix is effective
You write a regression test that is supposed to fail in the existing code, and pass in the fixed code.
-->

---
layout: pros-cons
---

::header::
# Approach A: The Workaround

::pros::
- Extremely fast
- 100% under control
- Isolated fix

::cons::
- Accumulates tech debt
- No upstream updates
- Risky upgrades

::right::
<<< @/snippets/scroll_behavior.dart dart

<!--
Approach A: Quick & Dirty Workaround
- Copying the code locally is quick but creates technical debt.
- We don't get updates, and we are stuck maintaining code that shouldn't be ours.
- Here, we copy StretchingOverscrollIndicator from Flutter SDK, make it FixedStretchingOverscrollIndicator, apply our one-line fix, and configure our ScrollBehavior to use it.
-->

---
layout: pros-cons
---

::header::
# Approach B: The Soft Fork

::pros::
- **Clean separation**
- **Tracks upstream updates**
- **Easy rollback**

::cons::
- **Maintenance overhead**
- **Infrastructure setup**
- **CI/CD complexity**

::right::
<<< @/snippets/pubspec.yaml yaml

<!--
Approach B: Soft Fork
- Maintain our own fork. Good for getting upstream updates, but requires active maintenance to resolve merge conflicts.
- We point our pubspec.yaml directly to our Git fork where we committed the fix.
- Makes sense if the upstream project is inactive or slow to merge. (Not the case for Flutter)
- For large projects such as Flutter, forking it can be a slippery slope. Introducing changes whenever we disagree with the direction of the framework can quickly become unmaintainable.
-->

---
layout: pros-cons
---

::header::
# Approach C: Upstream the Fix

::pros::
- **Zero long-term maintenance**
- **Improves ecosystem**
- **No local tech debt**

::cons::
- **Extremely slow process**
- **High bar of entry** (CLA, tests)
- **Friction with maintainers**

::right::
<<< @/snippets/overscroll_indicator.diff diff

<!--
Approach C: Upstream Contribution
- The ideal way. Raise an issue, make a PR.
- Takes the most effort upfront, but zero long-term maintenance.
- It is the only ethical approach because we improve the library for everyone.
- The actual fix is just a 1-line change to ensure duration doesn't drop to 0ms when velocity is low.
- To be specific, in this scenario the Flutter maintainers were very collaborative, but there was some organisational friction (more on that later).
-->

---
layout: three-approaches-with-charts
section: "Part 2: The Fix"
part1Title: "Approach A: Quick Workaround"
part2Title: "Approach B: Soft Fork"
part3Title: "Approach C: Upstream Fix"
---

::header::
# Comparing different approaches

::part1::
- **Duplicate & override** buggy code in your codebase
- Does the job, but does not benefit from updates, and accumulates tech debt

::part2::
- **Soft fork the project** with your custom fix
- Benefits from updates, but constant maintaining effort

::part3::
- **Contribute the fix** back to the original repository
- The ethical approach, but may take time meeting maintainer's standards

<!--
How do we fix a bug in code we don't own? 

Approach A: Quick & Dirty Workaround
- Copying the code locally is quick but creates technical debt.
- We don't get updates, and we are stuck maintaining code that shouldn't be ours.

Approach B: Soft Fork
- Maintain our own fork. Good for getting upstream updates, but requires active maintenance to resolve merge conflicts.
- Makes sense if the upstream project is inactive or slow to merge.

Both A and B are compromise solutions, typical for abandoned projects or small codebases.

Approach C: Upstream Contribution
- The ideal way. Raise an issue, make a PR.
- Takes the most effort upfront, but zero long-term maintenance.
- It is the only ethical approach because we improve the library for everyone.

It's not a one-size fits all though
And you might end up with a combination
-->

---
layout: center
separator: false
---

<img src="https://i.ytimg.com/vi/YINJj6DzBps/maxresdefault.jpg" alt="Several months later..."/>

---
layout: center
section: "Part 3: Is Flutter open-source?"
---

# Flutter is <span v-click="1" class="expand-text"><span>**not**</span></span>
<br/>

# open-source

<br/>

<v-click at="1">
Hear me out...
</v-click>

<!--
We're entering opinion domain now in Part 3

In my opinion, Flutter is not open-source, by the definition of it,
I'll explain why later 

Yes I have contributed to Flutter a few times

But from my experience as contributor, I would not proactively contribute to it again, unless I stumble on another bug and I feel like it is my duty to contribute back

Don't get me wrong, the community is amazing, the maintainers are very collaborative and they're always there to help

The contribution guidelines are explicit and very helpful

But it's clear that there is 1 big company who owns the brand and funds the project - Google. And that comes with its own risks. 
-->

---
layout: default
---

::header::
# Contribution License Agreement

::body::
Very intimidating

<v-clicks>

- Bypass copyleft restrictions

- Give away patent rights

</v-clicks>

<!---
And then there's something known as the CLA - Contributors License Agreement,

Before you can merge your very first PR in any open-source project maintained by Google,
you need to waive terms where you:
- Allow Google to use it for closed source software (bypassing copyleft)
- Grant Google right to distribute it forever
- Waive the right to change your mind
- Hand patent rights to Google

These terms are stricter than any pure Open source or copyleft license

While this is not a dealbreaker for many, having to sign a legal contract with such corporate terms might intimidate some people.
-->

---
layout: center
---

::header::
# If no one sees it, it didn't happen

::body::

(screenshot of github)
(iceberg image with public issues on surface, private issues )

<!--
The most demotivating part of it was

Learning that the bug we had collectively spent so much time debugging had already been reported internally, by one of Google's customers

Is a project really open-source if its main driver has a private list of issues?
-->

---
layout: default
---

::header::

::body::

<!--
Is it safe to say that tests are part of an open-source project?

One of my PRs got blocked because, despite being correct, it caused one of Google's internal tests to fail

I asked the Google maintainer what I could do about it. Nothing.

There was nothing in my control that could be done to help land my PR. No matter how many people approved it, or if it was functionally correct.

I had to wait for one of their internal engineers.

Whereas some projects have a private suite of tests (SQLite), Flutter has a private suite of issues and a private suite of tests.
-->

---
layout: default
---

::header::
# Not a great track record

::body::


killedbygoogle.com

<SlidevVideo v-click="+1" autoplay controls class="h-full w-full" autoreset="click">
  <source src="/images/killed-by-google.mov" />
</SlidevVideo>

<!---
Chances are, we all here, have our careers tied to Flutter in one way or another

And Google isn't known for keeping projects that are loved by many people alive.
-->

---
layout: default
---

::header::
# The Library of Alexandria

::body::

<!--
If (or when?) Google pulls the plug on Flutter, how much of these issues will be made public?
How many of these tests will be made public?

The community would lose important knowledge

It is way more likely that Flutter survives as a community project if these are made public.

Flutter's success should not depend on a single company with a poor track history of maintaining products long term.

Flutter's success should depend on what makes it great - its community!
-->

---
layout: center
---

# One line fix

<br/>

## Anyone could have fixed it

<br/>

## <span v-click="1" class="expand-text"><span>**Provided the bug was made public**</span></span>

<!--
The hard part of debugging this specific bug, was debugging it, not fixing it.

The fix was literally a 1 line change.

So many users affected by this issue in so many devices.

And this was known, internally, never prioritised.

Any one of us could have fixed it, had it been made public. This was all avoidable.

Disclaimer: all my criticism in this presentation are towards Google as an organisation. Not towards any of the Flutter members or Google employees involved. They were very helpful and collaborative, what you expect from Open source projects of this scale.
-->

---
layout: default
---

::header::
# The right direction

::body::

<!--
Celebrate recent changes that make Flutter less dependent on Google
Namely separating Material design from the base SDK - explain that Material had always been a first citizen and Cupertino (the iOS design system) left behind.

Canonical taking charge of Flutter Desktop development.

Honorable mention of React having a new home: The React Foundation

#ReleaseTheFlutterFiles
-->

---
layout: center
---

# Why should I care now?
Addressing the elephant in the room (AI)
<!--
Before AI, the best mobile frameworks would rise based on their quality - what people could achieve with them - and their community, documentation

AI has appeared when React and other javascript frameworks were the status quo

AI has changed this, like it or not, people don't rely on the community to get their questions answered, people don't read documentation anymore
AI models are extremely biases 
How many times have you asked Gemini to build an app (without specifying the stack) and it has chosen Flutter from the get go?

Flutter is in an uphill battle right now, and, as much as community and documentation is important right now, the only fair way to compete against the status quo is by simply being the best. 
-->
