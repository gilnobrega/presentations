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
layout: default
section: Intro
---

::header::

# Who is this for?

::body:: 

<v-clicks>

# Part 1: Debugging

- Establishing a thought process for debugging a complex bug that might live outside our direct control

</v-clicks>

<br/>

<v-clicks>

# Part 2: Fixing

- Exploring the possible ways one could fix a bug caused by a dependency

</v-clicks>

<br/>

# Part 3: State of Flutter
### as an open-source project

<!-- 
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

::right::

Material 3 scroll animation

<!--
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

(insert chart with 3 circles 
outer layer - sign up page, log in page, other product pages
middle layer - the app utility's such as design system, etc.
core layer - flutter
show a path from sign up page -> design system -> flutter to illustrate our debugging path)

<!--
While we're talking about our thought process when debugging a very specific bug, there is something that applies to all bugs here

We need to start at the outer shell first, debug it thoroughly and rule it out, moving our way into the core

And one thing we need to accept is that debugging becomes harder as the code becomes more alien to us, the effort for debugging and fixing code increases as we go down the dependency tree.
-->

---
layout: default
---

::header::
# Understanding StretchingOverscrollIndicator

---
layout: centre
---

# Why should I care?
Addressing the elephant in the room (AI)
<!--
Before AI, the best mobile frameworks would rise based on their quality - what people could achieve with them - and their community, documentation

AI has appeared when React and other javascript frameworks were the status quo

AI has changed this, like it or not, people don't rely on the community to get their questions answered, people don't read documentation anymore
AI models are extremely biases 
How many times have you asked Gemini to build an app (without specifying the stack) and it has chosen Flutter from the get go?

Flutter is in an uphill battle right now, and, as much as community and documentation is important right now, the only fair way to compete against the status quo is by simply being the best. 
-->
