---
layout: cv
title: Jevon Wright CV
permalink: /cv

# NOTE:
# jekyll doesn't support including markdown yet. Ugh.
# This is why we have the nasty { capture } junk.
# https://github.com/jekyll/jekyll/issues/1303
---

<section class="title">
  <h1>Dr Jevon Wright</h1>
  <h2>Curriculum Vitae &ndash; May 2025</h2>
</section>

<section>
  {% capture temp %}{% include cv/contact.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section>
  {% capture temp %}{% include cv/qualifications.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section class="history1 page-break-after1">
  {% capture temp %}{% include cv/history.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% comment %}
<section>
  {% capture temp %}{% include cv/talks.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% endcomment %}
<section>
  {% capture temp %}{% include cv/community.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
