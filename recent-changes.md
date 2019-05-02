---
layout: page
title: Recent changes
permalink: /recent-changes
---

{% include meta-nav.md %}

{%- if site.posts.size > 0 -%}
  <ul class="post-list">
    {%- assign all_posts = site.posts | concat: site.pages | sort: "date" | reverse -%}
    {%- for post in all_posts -%}
      {% include post-feed.md post=post %}
    {%- endfor -%}
  </ul>

  <p class="feed-subscribe"><svg class="svg-icon orange"><use xlink:href="{{ '/assets/minima-social-icons.svg#rss' | relative_url }}"></use></svg><a href="{{ "/feed.xml" | relative_url }}">Subscribe</a></p>
{%- endif -%}
