---
layout: page
title: Sitemap
permalink: /sitemap
---

{%- if site.posts.size > 0 -%}
  <ul class="post-list">
    {%- for post in site.posts -%}
    <li>
      {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
      <span class="post-meta">{{ post.date | date: date_format }}</span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
        </a>
      </h3>
      {%- if site.show_excerpts -%}
        {{ post.excerpt }}
      {%- endif -%}
    </li>
    {%- endfor -%}
  </ul>

  <p class="feed-subscribe"><svg class="svg-icon orange"><use xlink:href="{{ '/assets/minima-social-icons.svg#rss' | relative_url }}"></use></svg><a href="{{ "/feed.xml" | relative_url }}">Subscribe</a></p>
{%- endif -%}