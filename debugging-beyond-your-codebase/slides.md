---
theme: default
title: Debugging beyond your codebase
info: A guide on taking control of the code you don't own
author: Gil Nobrega
layout: cover
transition: slide-left
background: https://unqork.com/wp-content/uploads/2021/06/aHViPTEwMTAwNSZjbWQ9aXRlbWVkaXRvcmltYWdlJmZpbGVuYW1lPWl0ZW1lZGl0b3JpbWFnZV82MGMyN2YyYTg2ZjM3LnBuZyZ2ZXJzaW9uPTAwMDAmc2lnPWMzMDE1ZDIyN2ZiZmVjNDg3NmM2YTc1NTZjODQwNGNj-1.png
clickAnimation: fade-in
aspectRatio: 16/9
canvasWidth: 980
---

## Debugging beyond your codebase

A guide on taking control of the code you don't own

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

I'm currently employed as a senior mobile engineer at Tide, a fintech that provides services to over 2 million small and medium businesses in Europe and Asia.
-->

---
layout: three-parts
section: Intro
part1Title: "Part 1: Debugging an odd bug"
part2Title: "Part 2: Fixing that bug"
part3Title: "Part 3: State of Flutter"
---

::header::
# Who is this for?

::part1::
Establishing a thought process for debugging a complex bug that might live outside our direct control

::part2::
Exploring the possible ways one could fix a bug caused by a dependency

::part3::
Thoughts of a contributor on Flutter as an open-source project

<!-- 
In part 1 we're going to debug a very odd bug from a couple of years ago - a time before we had access to reliable AI tools - refreshing but also scary. In this case, we're going to be debugging an issue in the Flutter framework. But the thought process should be highly transferrable to other libraries and frameworks.

In Part 2 we're going to debate about contributing this fix or not. What is there to win and to lose?

In Part 3, it's going to be more of a personal reflection, I'm going to talk about what contributing to Flutter made me feel.

Raise of hands if you've contributed to an open-source project?

Raise of hands if you've contributed to Flutter?

Part 1 might not teach anything new to those 
It's still a very interesting case study so I hope you have fun

But stick around for Part 2
-->

---
layout: default
section: "Part 1: Debugging"
---

::header::

# Flutter at scale
Pushing a framework to its limits

::body::

<v-clicks>

# 🌍  2+ million users

# 📚 4 languages

# 📱 Many devices

<br/>Comes with its own challenges!

</v-clicks>

<!--
Tide is an app-first banking app.
Providing financial services to over 2+ million customers in Europe and Asia, in 4 languages and many iOS and Android devices in all shapes and forms.

When you reach this scale, you push the entire stack to its limits. The pain points of the stack you're using become your painpoints as an engineer.

-->

---
layout: center
---

## A bug affecting 1% of devices
<br/>

## <span v-click="1">may affect <span>**thousands**</span> of users</span>

<!--
A bug in a dependency cannot be swept under the rug. It becomes your bug.

A bug that cannot be replicated easily, let's say, it affects 1% of devices, in absolute terms it can still affect thousands of people. (More on that later)
-->

---
layout: default
---

::header::

# Codename: <span v-click="1" class="expand-text"><span>**Weird Stretchy Bug**</span></span>

::body::

<v-switch transition="cross-fade" unmount class="v-switch-crossfade">
  <template #1-3>
    <div class="flex justify-center h-full">
      <SlidevVideo v-click="2" autoplay controls class="h-100" autoreset="click">
        <source src="/images/weird-stretchy-bug-demo.mp4" />
      </SlidevVideo>
    </div>
  </template>

  <template #3-6>
    <div class="grid grid-cols-3 gap-6 h-full items-center justify-items-center">
      <img v-click="3" src="/images/weird-stretchy-bug-not-scrollable.png" class="h-full max-h-[350px] object-contain no-shadow" />
      <img v-click="4" src="/images/weird-stretchy-bug-scrollable.png" class="h-full max-h-[350px] object-contain no-shadow" />
      <img v-click="5" src="/images/weird-stretchy-bug-final-state.png" class="h-full max-h-[350px] object-contain no-shadow" />
    </div>
  </template>
</v-switch>

<!--

I'm part of the onboarding team, we're responsible for ensuring that we've got all necessary details before users can get their hands on financial products.

In a few words, we build the first impressions - the sign up journey, what's your name, where do you live, etc.

First impressions of an app are very important,
At this point, the loyalty of the user has not been built, and a small issue can very easily lead to the loss of a potential customer.

2 years ago, we had one of our QA engineers report this bug in our sign up page. Let's have a look:

-->

---
layout: two-cols-header
---

::header::
# Debugging the Sign Up page

::left::

<v-clicks>

- Inspected state management
- Asked other engineers
- Tested on many devices
- Impeller?

</v-clicks>

<img v-click src="https://storage.ghost.io/c/eb/aa/ebaa2665-01a8-4415-8825-69d1f0e8fd19/content/images/2025/05/works-on-my-machine-v2-2025-jon-galloway-1.png" class="mx-auto block h-40 no-shadow" />

::right::

<img src="/images/weird-stretchy-bug-final-state.png" class="h-full w-full object-contain no-shadow" />

<!--
We've tried everything to reproduce this issue
We investigated the state management of that page

We had a few text controllers that added Bloc events when they received focus and lost focus

Maybe one of them was somehow freezing the page when it lost focus?

We even asked if anyone of the other 100 engineers had experienced this, on this page, or in any other page.

We also tried a build with impeller and a bug without imepler and the QA engineer was able to reproduce an issue on both.

Now what do you do when you can't reproduce a bug that was reported once and never again?

Maybe it is a hardware issue? The QA is able to reproduce it semi-consistently in 1 device.

-->

---
layout: center
---

# Another report

<!--
A few days later my team's technical leader happened to be testing another unrelated feature, and, while he was signing up, he managed to reproduce the issue.

I was very interested in learning how, and called him and asked him to share his screen
He tried over and over again for a good 5 minutes, focusing in and out of the fields, with no success of reproducing it.

But now we know that it can affect other users.
Our hardware theory is debunked.
But we know that we've only been able to reproduce it in Android
-->

---
layout: two-cols-header
---

::header::

# What do we know?

::left::

<v-clicks>

- Only reproduced in Android (so far?)
- Every custom widget is stateless
- Stateful widgets come from Design System
- Therefore Design System must be to blame?

</v-clicks>

::right::

<img src="/images/weird-stretchy-bug-final-state.png" class="h-full w-full object-contain no-shadow" />

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

iOS:
<img v-click src="https://raw.githubusercontent.com/Codelessly/FlutterLoadingGIFs/master/packages/cupertino_activity_indicator.gif" class="h-50 no-shadow" />

::right::

Android:
<img v-click src="https://raw.githubusercontent.com/Codelessly/FlutterLoadingGIFs/master/packages/circular_progress_indicator.gif" class="h-50 no-shadow" />



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

<v-click>

Material 2 scroll animation

GlowingOverscrollIndicator

<img src="https://i.sstatic.net/LG8iP.gif" alt="Material 2 Overscroll Effect (glowing)" class="h-100 mx-auto" />

</v-click>

::right::

<v-click>

Material 3 scroll animation

StretchingOverscrollIndicator

<img src="https://developer.android.com/static/develop/ui/compose/images/m3-overscroll.gif" alt="Material 3 Overscroll Effect (Stretch)" class="h-100 mx-auto" />

</v-click>

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
layout: two-cols-header
---

::header::
# Ticking the basics

::left::
<v-click at="1">

- Enable debugging for dependencies

</v-click>

<div class="zoom-container" v-click="1">
  <img src="https://i.sstatic.net/kBVxr.jpg" class="no-shadow" :class="{ 'zoomed': $clicks >= 2 }" />
</div>

::right::

<v-click at="3">

- Read Contribution guidelines

</v-click>

<img v-click="3" src="/images/contribute-to-flutter.png" />


<!--
So now we think there is an issue in one of our dependencies, potentially in the Flutter framework.

In order to debug, raise an issue, and potentially to contribute back, we need to get a couple of things done.

First is to ensure that the IDE is configured to pause on breakpoints in the dependencies - outside of the workspace.

The second step is to get familiar with the contribution guidelines of that specific project. Smaller projects may not have a hard set of contribution guidelines, but larger projects will have them.

Fortunately for us, Flutter has a very well maintained set of guidelines.
-->

---
layout: default
---

::header::
## Understanding StretchingOverscrollIndicator

::body::

<<< @/snippets/stretching_overscroll_indicator.dart dart {all|130-133|151-156|180|228-233|214-217|217-226|219,222}{maxHeight:'360px'}

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
-->

---
layout: center
---

## What should an animation with **no duration** do?

Is it even an animation?
<!--

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
layout: center
separator: false
---

<<< @/snippets/overscroll_indicator.diff diff

---
layout: two-cols-header
rightRatio: 0.3
section: "Part 2: Fixing"
---

::header::
# Minimal Reproducible Code

::left::
<<< @/snippets/minimal_reproducible_code.dart dart {all|47-69|52-56|61-64|76-85}{maxHeight:'360px'}

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
layout: default
---
::header::

# Getting creative
Multiple ways to solve a problem

::body::

<<< @/snippets/stretching_animation_test.dart dart {all|10-17|48-65|35-37|39-44}{maxHeight:'340px'}

<!--
But there isn't just one way to make a hard to reproduce bug more easily reproducible

Sometimes you need to get more creative 

Later when I was writing a regression test I realised that another way to reduce velocity is by increasing drag

And this is another way to make sure your bug fix is effective
You write a regression test that is supposed to fail in the existing code, and pass in the fixed code.

In this one, we apply a very high drag,

Then we assert that the overscroll notification was received at a very low velocity that should trigger the bug (under 25)

Then we check that the rendered size of the boxes matches their original size (not stretched)
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
<<< @/snippets/scroll_behavior.dart dart {all|1-3|5-16|18-30}{maxHeight:'360px'}

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
- Clean separation
- Tracks upstream updates
- Easy rollback

::cons::
- Maintenance overhead
- Infrastructure setup
- CI/CD complexity

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
- Zero long-term maintenance
- Improves ecosystem
- No local tech debt

::cons::
- Extremely slow process
- High bar of entry (CLA, tests)
- Friction with maintainers

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
clicks: 4
part1Title: "Approach A: Quick Workaround"
part2Title: "Approach B: Soft Fork"
part3Title: "Approach C: Upstream Fix"
---

::header::
# Comparing approaches

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
And you might end up with a combination: Approach A for short term gains, and Approach C for long term low maintenance.
-->

---
layout: center
separator: false
---

<img src="https://i.ytimg.com/vi/YINJj6DzBps/maxresdefault.jpg" class="h-100" alt="Several months later..."/>

---
layout: center
separator: false
---

<img src="/images/pr-merged.png" />

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

Disclaimer: all my criticism in this presentation are towards Google as an organisation. Not towards any of the Flutter members or Google employees involved. They were very helpful and collaborative, what you expect from Open source projects of this scale.
-->

---
layout: two-cols-header
---

::header::
# Contributor License Agreement

::left::

<v-clicks>

- Protects Google and the project, but...

- Bypass copyleft restrictions

- Give away patent rights

</v-clicks>

::right::

Very intimidating legal contract

[cla.developers.google.com/clas](https://cla.developers.google.com/clas)

<img src="/images/google-cla.png" />

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
layout: two-cols-iceberg
rightRatio: 0.75
---

::header::
# The Iceberg of Issues

::left::

<img v-click class="mx-auto w-full" src="/images/internal-stretched-state-issue.png" />

<div v-after></div>

<!--
The most demotivating part of it was

Learning that the bug we had collectively spent so much time debugging had already been reported internally, by one of Google's customers

Is a project really open-source if its main driver has a private list of issues?
-->

---
layout: two-cols-header
---

::header::
# Handholding is mandatory

::left::

<img v-click class="mx-auto" src="/images/cupertino-on-off-labels-pr.png" />


::right::

<img v-click class="mx-auto" src="/images/revert-cupertino-on-off-labels-pr.png" />

<!--
Is it safe to say that tests are part of an open-source project?

One of my PRs got blocked because, despite being correct, it caused one of Google's internal tests to fail

I asked the Google maintainer what I could do about it. Nothing.

There was nothing in my control that could be done to help land my PR. No matter how many people approved it, or if it was functionally correct.

I had to wait for one of their internal engineers.

Whereas some projects have a private suite of tests (SQLite), Flutter has a private suite of issues and a private suite of tests.
-->

---
layout: center
---

# Why should I care?

<!--
You're probably thinking, why should I care that Flutter is not really open source?

All that's important is that Google is still maintaining it. Right?

Well that's the problem. If you're in this meeting, you're likely interested in Flutter because you built your career with it, or you aspire to do so.
So you probably want Flutter to succeed.

However... Google doesn't have a great track record when it comes to maintaining successful projects (open source or not)
-->

---
layout: default
---

::header::
# Not a great track record

::body::

[killedbygoogle.com](https://killedbygoogle.com)

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

<img src="https://i.natgeofe.com/n/2000b450-bd56-4a9d-bd24-05b15ebf420f/HYEF9E_16x9.jpg?w=1200" class="h-full mx-auto" />

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

-->

---
layout: center
---

# What now?

<!--
Ok so now we might agree that there are some risks and disadvantages of having 1 big player driving the framework that powers most new apps pays our salaries.

At the end of the day we don't have the millions of dollars such a massive project needs.

But what can be done about it?
-->

---
layout: default
---

::header::
# A community-owned Flutter
Easier said than done

::body::
[getflocked.dev](https://getflocked.dev)

<v-switch transition="cross-fade" class="v-switch-crossfade">
  <template #1>
    <img src="/images/flock-landing-page.png" class="h-70 mx-auto" />
  </template>
  <template #2>
    <img src="/images/flock-repo.png" class="h-70 mx-auto" />
  </template>
</v-switch>

---
layout: default
---

::header::
# The right direction
Walking towards a more decentralised Flutter

::body::

<v-switch transition="cross-fade" unmount class="v-switch-crossfade">
  <template #1>
    <img src="/images/decouple-flutter-material-cupertino.png" />
  </template>
  <template #2>
    <img class="h-80 mx-auto" src="/images/canonical-lead-maintainer-flutter-desktop.png" />
  </template>
</v-switch>

<!--
But even under Google, it doesn't mean that the project is not going in the right direction

Namely separating Material design from the base SDK - explain that Material had always been a first citizen and Cupertino (the iOS design system) left behind.

Canonical taking charge of Flutter Desktop development.

#ReleaseTheFlutterFiles
-->

---
layout: two-cols-header
---

::header::
# What is the end goal?
... or what we should be aiming for

::left::

[react.foundation](https://react.foundation)

<img v-click src="https://react.dev/images/blog/react-foundation/react_foundation_logo.png" class="h-30 mx-auto" alt="React Foundation logo" />

::right::

<img v-click class="h-50 mx-auto" src="https://react.dev/images/blog/react-foundation/react_foundation_member_logos.png" />

<!--
What could the future reserve for Flutter?

Ideally a similar goal than React,

Managed by the React Foundation (part of the Linux foundation)

With a decentralised Governing Board
-->

---
layout: center
---

# Why should I care **now**?
Addressing the elephant in the room (AI)
<!--
Before AI, the best mobile frameworks would rise based on their quality - what people could achieve with them - and their community, documentation

AI has appeared when React and other javascript frameworks were the status quo

AI has changed this, like it or not, people don't rely on the community to get their questions answered, people don't read documentation anymore
AI models are extremely biases 
How many times have you asked Gemini to build an app (without specifying the stack) and it has chosen Flutter from the get go?

Flutter is in an uphill battle right now, and, as much as community and documentation is important right now, the only fair way to compete against the status quo is by simply being the best. 
-->

---
layout: two-cols-header
section: Links, Q&A
---

::header::
# Links

::left::

<v-click>

Made with **[Sli.dev](https://sli.dev)** framework, using Antigravity IDE

<div class="bg-white p-4 w-48 h-48 flex items-center justify-center m-auto">
    <style>
        .qr-container svg { width: 100%; height: 100%; }
    </style>
    <div class="qr-container w-full h-full">
        <svg viewBox="0 0 37 37" xmlns="http://www.w3.org/2000/svg"><rect width="37px" height="37px" fill="#ffffff"></rect><path d="M4,4h1v1h-1M5,4h1v1h-1M6,4h1v1h-1M7,4h1v1h-1M8,4h1v1h-1M9,4h1v1h-1M10,4h1v1h-1M12,4h1v1h-1M14,4h1v1h-1M16,4h1v1h-1M17,4h1v1h-1M19,4h1v1h-1M24,4h1v1h-1M26,4h1v1h-1M27,4h1v1h-1M28,4h1v1h-1M29,4h1v1h-1M30,4h1v1h-1M31,4h1v1h-1M32,4h1v1h-1M4,5h1v1h-1M10,5h1v1h-1M12,5h1v1h-1M13,5h1v1h-1M15,5h1v1h-1M19,5h1v1h-1M23,5h1v1h-1M24,5h1v1h-1M26,5h1v1h-1M32,5h1v1h-1M4,6h1v1h-1M6,6h1v1h-1M7,6h1v1h-1M8,6h1v1h-1M10,6h1v1h-1M12,6h1v1h-1M14,6h1v1h-1M15,6h1v1h-1M18,6h1v1h-1M19,6h1v1h-1M20,6h1v1h-1M24,6h1v1h-1M26,6h1v1h-1M28,6h1v1h-1M29,6h1v1h-1M30,6h1v1h-1M32,6h1v1h-1M4,7h1v1h-1M6,7h1v1h-1M7,7h1v1h-1M8,7h1v1h-1M10,7h1v1h-1M12,7h1v1h-1M13,7h1v1h-1M15,7h1v1h-1M18,7h1v1h-1M19,7h1v1h-1M20,7h1v1h-1M23,7h1v1h-1M26,7h1v1h-1M28,7h1v1h-1M29,7h1v1h-1M30,7h1v1h-1M32,7h1v1h-1M4,8h1v1h-1M6,8h1v1h-1M7,8h1v1h-1M8,8h1v1h-1M10,8h1v1h-1M12,8h1v1h-1M13,8h1v1h-1M14,8h1v1h-1M15,8h1v1h-1M16,8h1v1h-1M17,8h1v1h-1M20,8h1v1h-1M21,8h1v1h-1M22,8h1v1h-1M23,8h1v1h-1M26,8h1v1h-1M28,8h1v1h-1M29,8h1v1h-1M30,8h1v1h-1M32,8h1v1h-1M4,9h1v1h-1M10,9h1v1h-1M15,9h1v1h-1M16,9h1v1h-1M17,9h1v1h-1M20,9h1v1h-1M22,9h1v1h-1M23,9h1v1h-1M26,9h1v1h-1M32,9h1v1h-1M4,10h1v1h-1M5,10h1v1h-1M6,10h1v1h-1M7,10h1v1h-1M8,10h1v1h-1M9,10h1v1h-1M10,10h1v1h-1M12,10h1v1h-1M14,10h1v1h-1M16,10h1v1h-1M18,10h1v1h-1M20,10h1v1h-1M22,10h1v1h-1M24,10h1v1h-1M26,10h1v1h-1M27,10h1v1h-1M28,10h1v1h-1M29,10h1v1h-1M30,10h1v1h-1M31,10h1v1h-1M32,10h1v1h-1M12,11h1v1h-1M17,11h1v1h-1M18,11h1v1h-1M19,11h1v1h-1M24,11h1v1h-1M5,12h1v1h-1M6,12h1v1h-1M8,12h1v1h-1M10,12h1v1h-1M11,12h1v1h-1M15,12h1v1h-1M16,12h1v1h-1M17,12h1v1h-1M18,12h1v1h-1M19,12h1v1h-1M23,12h1v1h-1M24,12h1v1h-1M26,12h1v1h-1M28,12h1v1h-1M29,12h1v1h-1M30,12h1v1h-1M31,12h1v1h-1M32,12h1v1h-1M4,13h1v1h-1M6,13h1v1h-1M8,13h1v1h-1M12,13h1v1h-1M14,13h1v1h-1M15,13h1v1h-1M18,13h1v1h-1M20,13h1v1h-1M23,13h1v1h-1M24,13h1v1h-1M25,13h1v1h-1M28,13h1v1h-1M29,13h1v1h-1M30,13h1v1h-1M32,13h1v1h-1M7,14h1v1h-1M8,14h1v1h-1M10,14h1v1h-1M11,14h1v1h-1M12,14h1v1h-1M16,14h1v1h-1M18,14h1v1h-1M19,14h1v1h-1M21,14h1v1h-1M23,14h1v1h-1M24,14h1v1h-1M30,14h1v1h-1M31,14h1v1h-1M32,14h1v1h-1M5,15h1v1h-1M12,15h1v1h-1M15,15h1v1h-1M18,15h1v1h-1M19,15h1v1h-1M20,15h1v1h-1M21,15h1v1h-1M24,15h1v1h-1M25,15h1v1h-1M26,15h1v1h-1M28,15h1v1h-1M31,15h1v1h-1M5,16h1v1h-1M6,16h1v1h-1M9,16h1v1h-1M10,16h1v1h-1M13,16h1v1h-1M16,16h1v1h-1M18,16h1v1h-1M19,16h1v1h-1M21,16h1v1h-1M23,16h1v1h-1M24,16h1v1h-1M26,16h1v1h-1M27,16h1v1h-1M29,16h1v1h-1M4,17h1v1h-1M6,17h1v1h-1M8,17h1v1h-1M12,17h1v1h-1M14,17h1v1h-1M17,17h1v1h-1M18,17h1v1h-1M21,17h1v1h-1M22,17h1v1h-1M24,17h1v1h-1M25,17h1v1h-1M26,17h1v1h-1M27,17h1v1h-1M31,17h1v1h-1M32,17h1v1h-1M8,18h1v1h-1M9,18h1v1h-1M10,18h1v1h-1M12,18h1v1h-1M13,18h1v1h-1M15,18h1v1h-1M22,18h1v1h-1M24,18h1v1h-1M26,18h1v1h-1M27,18h1v1h-1M30,18h1v1h-1M31,18h1v1h-1M32,18h1v1h-1M4,19h1v1h-1M6,19h1v1h-1M8,19h1v1h-1M11,19h1v1h-1M12,19h1v1h-1M13,19h1v1h-1M14,19h1v1h-1M17,19h1v1h-1M18,19h1v1h-1M21,19h1v1h-1M22,19h1v1h-1M27,19h1v1h-1M31,19h1v1h-1M4,20h1v1h-1M5,20h1v1h-1M6,20h1v1h-1M10,20h1v1h-1M16,20h1v1h-1M17,20h1v1h-1M20,20h1v1h-1M22,20h1v1h-1M23,20h1v1h-1M26,20h1v1h-1M28,20h1v1h-1M29,20h1v1h-1M6,21h1v1h-1M7,21h1v1h-1M8,21h1v1h-1M11,21h1v1h-1M14,21h1v1h-1M15,21h1v1h-1M17,21h1v1h-1M18,21h1v1h-1M19,21h1v1h-1M20,21h1v1h-1M21,21h1v1h-1M22,21h1v1h-1M23,21h1v1h-1M27,21h1v1h-1M29,21h1v1h-1M30,21h1v1h-1M31,21h1v1h-1M32,21h1v1h-1M4,22h1v1h-1M6,22h1v1h-1M8,22h1v1h-1M10,22h1v1h-1M11,22h1v1h-1M12,22h1v1h-1M14,22h1v1h-1M15,22h1v1h-1M17,22h1v1h-1M19,22h1v1h-1M20,22h1v1h-1M21,22h1v1h-1M22,22h1v1h-1M25,22h1v1h-1M27,22h1v1h-1M31,22h1v1h-1M32,22h1v1h-1M5,23h1v1h-1M6,23h1v1h-1M7,23h1v1h-1M8,23h1v1h-1M12,23h1v1h-1M15,23h1v1h-1M18,23h1v1h-1M20,23h1v1h-1M21,23h1v1h-1M22,23h1v1h-1M23,23h1v1h-1M26,23h1v1h-1M4,24h1v1h-1M6,24h1v1h-1M9,24h1v1h-1M10,24h1v1h-1M11,24h1v1h-1M13,24h1v1h-1M16,24h1v1h-1M18,24h1v1h-1M19,24h1v1h-1M21,24h1v1h-1M24,24h1v1h-1M25,24h1v1h-1M26,24h1v1h-1M27,24h1v1h-1M28,24h1v1h-1M30,24h1v1h-1M31,24h1v1h-1M32,24h1v1h-1M12,25h1v1h-1M13,25h1v1h-1M16,25h1v1h-1M19,25h1v1h-1M20,25h1v1h-1M24,25h1v1h-1M28,25h1v1h-1M31,25h1v1h-1M32,25h1v1h-1M4,26h1v1h-1M5,26h1v1h-1M6,26h1v1h-1M7,26h1v1h-1M8,26h1v1h-1M9,26h1v1h-1M10,26h1v1h-1M12,26h1v1h-1M16,26h1v1h-1M21,26h1v1h-1M23,26h1v1h-1M24,26h1v1h-1M26,26h1v1h-1M28,26h1v1h-1M30,26h1v1h-1M31,26h1v1h-1M32,26h1v1h-1M4,27h1v1h-1M10,27h1v1h-1M13,27h1v1h-1M14,27h1v1h-1M18,27h1v1h-1M20,27h1v1h-1M24,27h1v1h-1M28,27h1v1h-1M32,27h1v1h-1M4,28h1v1h-1M6,28h1v1h-1M7,28h1v1h-1M8,28h1v1h-1M10,28h1v1h-1M12,28h1v1h-1M13,28h1v1h-1M19,28h1v1h-1M24,28h1v1h-1M25,28h1v1h-1M26,28h1v1h-1M27,28h1v1h-1M28,28h1v1h-1M29,28h1v1h-1M31,28h1v1h-1M32,28h1v1h-1M4,29h1v1h-1M6,29h1v1h-1M7,29h1v1h-1M8,29h1v1h-1M10,29h1v1h-1M14,29h1v1h-1M15,29h1v1h-1M16,29h1v1h-1M18,29h1v1h-1M19,29h1v1h-1M24,29h1v1h-1M25,29h1v1h-1M28,29h1v1h-1M29,29h1v1h-1M4,30h1v1h-1M6,30h1v1h-1M7,30h1v1h-1M8,30h1v1h-1M10,30h1v1h-1M12,30h1v1h-1M13,30h1v1h-1M15,30h1v1h-1M16,30h1v1h-1M17,30h1v1h-1M18,30h1v1h-1M22,30h1v1h-1M23,30h1v1h-1M27,30h1v1h-1M28,30h1v1h-1M29,30h1v1h-1M30,30h1v1h-1M32,30h1v1h-1M4,31h1v1h-1M10,31h1v1h-1M12,31h1v1h-1M14,31h1v1h-1M19,31h1v1h-1M21,31h1v1h-1M23,31h1v1h-1M26,31h1v1h-1M27,31h1v1h-1M31,31h1v1h-1M4,32h1v1h-1M5,32h1v1h-1M6,32h1v1h-1M7,32h1v1h-1M8,32h1v1h-1M9,32h1v1h-1M10,32h1v1h-1M13,32h1v1h-1M15,32h1v1h-1M16,32h1v1h-1M20,32h1v1h-1M21,32h1v1h-1M22,32h1v1h-1M23,32h1v1h-1M28,32h1v1h-1M30,32h1v1h-1M31,32h1v1h-1M32,32h1v1h-1" fill="#000000"></path></svg>
    </div>
</div>

[github.com/gilnobrega/presentations/tree/main/debugging-beyond-your-codebase](https://github.com/gilnobrega/presentations/tree/main/debugging-beyond-your-codebase)

</v-click>

::right::

<v-click>

<div class="m-auto m-t-30 m-l-30" >

# Questions?

</div>

</v-click>

<v-click>

<div class="m-l-30 m-t-10">

<Socials />

</div>

</v-click>

<!--
Thank you! Any questions?
-->

---
layout: center
---

## One more thing...

<br/>

<v-click>

# \#ReleaseThe**Flutter**Files

</v-click>

<!--
If you believe that the community deserves more transparency, public issues and public tests, 

Then let's start talking about it.
-->
