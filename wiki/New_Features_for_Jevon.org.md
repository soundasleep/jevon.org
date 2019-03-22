---
layout: page
title:  New Features for Jevon.org
author: jevon
date:   2013-01-07 01:14:34 +13:00
tags:
  - TODO
redirect_from:
  - "/wiki/New Features for Jevon.org"
---

Some ideas that I'd like to implement for the new Jevon.org...
<style>.done { color: gray; text-decoration: line-through; }</style>

## High Priority
1. <span class="done">An actually functioning OpenID server</span> - <a href="http://journals.jevon.org/users/server/entry/20123">completed</a> 6 January 2013
1. <span class="done">Slightly improved Wiki syntax</span> - [completed](special-Formatting.md) in r4531
1. <span class="done">Support for redirections in Wiki</span> - completed in r4540 using `#REDIRECT [Title](title.md)`
1. <span class="done">Wiki pages actually support versions and diff between them</span> - completed in r4546, see [History:42](history-42.md) or [History:43](history-43.md)
1. Revisit all links in the [TODO](Todo.md) category
1. <span class="done">Support syntax highlighting (see <a href="http://code.google.com/p/google-code-prettify/">Google Code syntax highlighting</a>)</span> - [completed](special-Formatting.md) in r4531
1. Update [profile page](Jevon_Wright.md)
1. Update [research profile page](Research.md)
1. Add new [photos](Photos.md)
1. <span class="done">Use `_italic_` and `*bold*` Wiki syntax instead</span> - completed in r4520
1. <span class="done">Fix [Special:Recent Changes](special-recent-changes.md)</span> - completed in r4529
1. Automatically add links to RFC nnnn, ISO nnnn, DOI nnnn, ISBN

## Normal Priority
1. <span class="done">Favicon</span> - done in r4551 (to the icon from [user=jevon])
1. Support Cron jobs, along with an interface to job status
1. <span class="done">An improved user interface/new design</span> - done in r4558
1. Allow users to place comments on Wiki pages (with Captcha for spam, etc)
1. <span class="done">Allow `code` blocks to specify language</span> - [completed](special-Formatting.md) in r4531 using `[code java]`
1. An "activity feed" displaying my activity around the Internet
1. Screenshots of all old Jevon.org websites and versions (started)
1. Add a cron job to mirror all links (text-only) (just for me)
1. A SPAM detection framework, that allows for spammy phrases to be tagged, and perhaps a callback interface to permit asynchronous moderation
1. Allow deletion of old history entries (should not require any weird diff magic)

## Low Priority
1. Rewrite/refactor the [Journals](Journals.md)
1. Rewrite/refactor the [Music Wiki](music-wiki.md)
1. Add CV
1. Add a cron job to identify broken links, and possibly replace link with local mirror

### Possible Activity Feed Sources
1. SVN commits, records
1. Blog posts, journal posts
1. Last.fm scrobbles, journals, records
1. Twitter posts, records
1. Delicious saves, records
1. Reddit posts, records
1. Ohloh activity, records
1. Flickr posts, records
1. jevon.org edits, records

Allow people to comment on feed activity - perhaps through both <a href="https://developers.facebook.com/blog/post/472/">Facebook Comments</a>, and a home-written one (requires account management)?
