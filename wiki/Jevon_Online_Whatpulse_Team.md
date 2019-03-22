---
layout: page
title:  "Jevon Online Whatpulse Team"
author: jevon
date:   2008-07-22 07:27:09 +1200
tags:   [Article]
---

[Articles](Articles.md)

Are you looking for <a href="http://whatpulse.org/stats/users/1450/">my WhatPulse profile</a> instead?

_(copied verbatim from the old existing article)_

First, thanks for visiting this page. If you have come here, you must be a very good community member of the Jevon Online, Journals or Jevon Online DC Hub community. Because it is such a wonderfully geeky thing, I'm co-ordinating an effort to group together a team for WhatPulse, and we can show the world just how terribly geeky we are :grin:. Plus, it's such a cool thing to do. ;)

## About Pulse
Pulse (and in this case, WhatPulse, is a co-ordinated effort to bring together the effors of distributed typing. Using valuable Internet resources, you can now keep a record of the number of keys you've pressed over your lifetime. You can even join a team (like the Jevon Online Team) and participate in group distributed typing. :D

## How to Join
1. Go to http://pulse.whatnet.org and sign up for an account.
1. Download the client, and install it.
1. Get the client running.
1. On the http://pulse.whatnet.org webpage, login, and go to join a team.
1. Join the "<a href="http://whatpulse.org/stats/team.php?tid=106">Jevon Online</a>" team (team 106).

And that's all there is to it! Once you send your very first pulse, you will be placed on the team, and you can help us to glory. :D

## Security Considerations
I investigated the client quite significantly, and I feel confident that it is not a security issue. Why?

First, I investigated into how the client transmits its pulses. It transmits the pulses to a CGI script over HTTP via GET. That is, the pulses are like so: (I replaced some characters with 'xxx' for my privacy.)

```
GET /cgi-bin/pulse.cgi?jh8=pp&an=jevon&pwd=lhsng7xxxxxxxxxxx
xxxxflZ&kc=lrsjt7kiIljbmoxxxxxxxxxxxxxxxxxxxxxxklilv2oxdgjVh
iQiceiiZliPmfomhdniHnxjorDgkv&tsec=1061448232
```

There doesn't appear to be anything suspicious from here; **jh8** seems to be the update mode, **an** appears to be the username, **pwd** an encrypted (or encoded with base64) password, **kc** the keycount (encrypted somehow, perhaps with base64), and **tsec** probably the Unix timestamp of the current submitted time. Or maybe the timestamp of the last submission, so the program can work out the interval? (_Thanks to Colin T. for suggesting a few tips on decoding this query string!_)

Investigation on the internet also led me to believe that it was not a security issue. The WhatPulse project was based on the Project Dolphin project, which was basically the same project just with fewer features. This project was open source for a short period of time, but the project was abandoned when the author could no longer support the resource drain. Numerous articles and the length that this project has been up has also led me to believe that it is unlikely to have a sort of keylogging facility. (If I knew how to reverse assemble, I would have used this ability, too. ;))

In short, join the team and have some fun. :D
