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
  <h2>Curriculum Vitae, January 2023</h2>
  <h3>
    <a href="mailto:jevon@jevon.org">jevon@jevon.org</a>
    &ndash;
    <a href="https://jevon.org">https://jevon.org</a>
  </h3>
</section>

<section>
  {% capture temp %}{% include cv/contact.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
<section>
  {% capture temp %}{% include cv/qualifications.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% comment %}
<section class="skills">
  {% capture temp %}{% include cv/skills.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% endcomment %}
{% comment %}
<section class="open-source page-break-after">
  {% capture temp %}{% include cv/open-source.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% endcomment %}
<section class="history">
  {% capture temp %}{% include cv/history.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% comment %}
<section>
  {% capture temp %}{% include cv/talks.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% endcomment %}
{% comment %}
<section>
  {% capture temp %}{% include cv/publications.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% endcomment %}
<section>
  {% capture temp %}{% include cv/community.md %}{% endcapture %}
  {{ temp | markdownify }}
</section>
{% comment %}
{%- if jekyll.environment != 'production' -%}
  <section class="references">
    {% capture temp %}{% include cv/references.md %}{% endcapture %}
    {{ temp | markdownify }}
  </section>
{% endif %}
{% endcomment %}
