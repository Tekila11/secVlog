---
layout: tag
title: "Tag: authentication"
tag: authentication
permalink: /tags/authentication/
---

{% for post in site.tags.authentication %}
<article class="post">
    <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    <div class="post-meta">
        <span class="date">{{ post.date | date: "%B %d, %Y" }}</span>
    </div>
</article>
{% endfor %}
