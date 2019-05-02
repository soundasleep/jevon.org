{%- comment -%}
  We need to check for post.title, because jekyll-redirect-from
  adds lots of empty posts in site.posts/site.pages.
  See: https://github.com/jekyll/jekyll-redirect-from/issues/200
{%- endcomment -%}
{%- if post.title -%}
<li>
  <h3>
    <a class="post-link" href="{{ post.url | relative_url }}">
      {{ post.title | escape }}
    </a>
  </h3>
  {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
  <span class="post-meta">
    {{ post.date | date: date_format }}

    {% if post.tags.size > 0 %}
      - {{ post.tags | sort | join: ", " }}
    {% endif %}
  </span>
  {%- if site.show_excerpts -%}
    {{ post.excerpt }}
  {%- endif -%}
</li>
{%- endif -%}
