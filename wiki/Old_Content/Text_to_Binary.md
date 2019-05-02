---
layout: page
title:  Old Content/Text to Binary
author: jevon
date:   2002-10-22 00:00:00 +0000
tags:
  - Article
---

{% include old-content-header.md date="22 October 2002" %}

Bored one day, while procrastinating to do any meaningful study for my upcoming finals, and inspired by the chat on a friendly DC hub, I set out to create the shortest piece of code that I could create, which would run in [Internet Explorer](internet-explorer.md), to convert text into binary. I finally managed to squeeze it down to 186 characters of Javascript, or 195 characters long if you include the &lt;script&gt; and about: tags. My final code is:

`about:<script>q=new Array(1,2,4,8,16,32,64,128);y=prompt(t="",t);for(j=0;j<y.length;t+="")for(n=y.charCodeAt(j++),i=7;i>=0;n-=(n>=q[i]?q[t+=1,i]:(t+=0,0)),i--);document.write(y+"="+t);</script>`

If you copy and paste that into your [Internet Explorer](internet-explorer.md) taskbar, you should get the code running perfectly - type in some characters and it will convert them into binary for you.

Enjoy! :D
