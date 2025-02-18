---
layout: tag
title: "Tag: web"
tag: web
permalink: /secVlog/tags/web/
---

{% for post in site.tags.web %}
<article class="post">
    <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    <div class="post-meta">
        <span class="date">{{ post.date | date: "%B %d, %Y" }}</span>
    </div>
</article>
{% endfor %}
