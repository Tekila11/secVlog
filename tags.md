---
layout: page
title: Tags
permalink: /tags/
---

<div class="tags">
    {% for tag in site.tags %}
    <h2 id="{{ tag[0] }}">{{ tag[0] }}</h2>
    <ul>
        {% for post in tag[1] %}
        <li>
            <a href="{{ post.url }}">{{ post.title }}</a>
            <span class="post-meta">{{ post.date | date: "%B %d, %Y" }}</span>
        </li>
        {% endfor %}
    </ul>
    {% else %}
    <p>No tags found.</p>
    {% endfor %}
</div>

<pre>{{ site.tags | inspect }}</pre>