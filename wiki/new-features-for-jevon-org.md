---
layout: page
title:  "New Features for Jevon.org"
author: jevon
date:   2013-01-06 18:37:03 +1300
---

Some ideas that I'd like to implement for the new Jevon.org...
<style>.done { color: gray; text-decoration: line-through; }</style>

==High Priority==
# <span class="done">An actually functioning OpenID server</span> - <a href="http://journals.jevon.org/users/server/entry/20123">completed</a> 6 January 2013
# <span class="done">Slightly improved Wiki syntax</span> - [[Special:Formatting|completed]] in r4531
# <span class="done">Support for redirections in Wiki</span> - completed in r4540 using `#REDIRECT [[Title]]`
# <span class="done">Wiki pages actually support versions and diff between them</span> - completed in r4546, see [[History:TODO]]
# A SPAM detection framework, that allows for spammy phrases to be tagged, and perhaps a callback interface to permit asynchronous moderation
# Revisit all links in the [[TODO]] category
# <span class="done">Support syntax highlighting (see <a href="http://code.google.com/p/google-code-prettify/">Google Code syntax highlighting</a>)</span> - [[Special:Formatting|completed]] in r4531
# Update profile page
# Update research profile page
# Add new photos
# <span class="done">Use `_italic_` and `*bold*` Wiki syntax instead</span> - completed in r4520
# <span class="done">Fix [[Special:Recent Changes]]</span> - completed in r4529
# Automatically add links to RFC nnnn, ISO nnnn, DOI nnnn, ISBN

==Normal Priority==
# Support Cron jobs, along with an interface to job status
# An improved user interface/new design
# Allow users to place comments on Wiki pages (with Captcha for spam, etc)
# <span class="done">Allow `code` blocks to specify language</span> - [[Special:Formatting|completed]] in r4531 using `[code java]`
# An "activity feed" displaying my activity around the Internet
# Screenshots of all old Jevon.org websites and versions
# Add a cron job to mirror all links (text-only) (just for me)

==Low Priority==
# Rewrite/refactor the [[Journals]]
# Rewrite/refactor the [[Music Wiki]]
# Add CV
# Add a cron job to identify broken links, and possibly replace link with local mirror

=Possible Activity Feed Sources=
# SVN commits, records
# Blog posts, journal posts
# Last.fm scrobbles, journals, records
# Twitter posts, records
# Delicious saves, records
# Reddit posts, records
# Ohloh activity, records
# Flickr posts, records
# jevon.org edits, records

Allow people to comment on feed activity - perhaps through both <a href="https://developers.facebook.com/blog/post/472/">Facebook Comments</a>, and a home-written one (requires account management)?

[[Category:TODO]]