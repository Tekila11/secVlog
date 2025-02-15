---
layout: default
title: Articles
---

<h1>Articles</h1>

<ul>
    {% for article in site.articles %}
    <li>
        <a href="{{ article.url }}">{{ article.title }}</a>
        <span class="post-meta">
            {{ article.date | date: "%B %d, %Y" }} | {{ article.content | number_of_words | divided_by: 180 | plus: 1 }} min read
        </span>
    </li>
    {% endfor %}
</ul>