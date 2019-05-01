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
  <h1>Curriculum Vitae</h1>
  <h2>{{ site.time | date: "%B %Y" }}</h2>
</section>

<section>
  {% capture temp %}{% include cv/contact.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section>
  {% capture temp %}{% include cv/qualifications.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section class="skills page-break-after">
  {% capture temp %}{% include cv/skills.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section class="open-source">
  {% capture temp %}{% include cv/open-source.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section class="history page-break-after">
  {% capture temp %}{% include cv/history.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section>
  {% capture temp %}{% include cv/publications.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section>
  {% capture temp %}{% include cv/community.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{%- if jekyll.environment != 'production' -%}
  <section class="references">
    {% capture temp %}{% include cv/references.md %}{% endcapture %}
    {{ temp | markdownify }}
  </section>
{% endif %}