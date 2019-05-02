---
layout: page
title: All Pages
permalink: /pages
---

{% include meta-nav.md %}

{%- if site.posts.size > 0 -%}
  <ul class="post-list">
    {% comment %}
      Cannot use `sort_natural` until `github-pages` gem upgrades to liquid 4.0.0+: https://github.com/github/pages-gem/issues/638
    {% endcomment %}
    {%- assign all_posts = site.posts | concat: site.pages | sort: "title" -%}
    {%- for post in all_posts -%}
      {% include post-feed.md post=post %}
    {%- endfor -%}
  </ul>

  <p class="feed-subscribe"><svg class="svg-icon orange"><use xlink:href="{{ '/assets/minima-social-icons.svg#rss' | relative_url }}"></use></svg><a href="{{ "/feed.xml" | relative_url }}">Subscribe</a></p>
{%- endif -%}
