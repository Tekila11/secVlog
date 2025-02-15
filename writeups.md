---
layout: default
title: Writeups
---

<h1>Writeups</h1>

<ul>
    {% for writeup in site.writeups %}
    <li>
        <a href="{{ writeup.url }}">{{ writeup.title }}</a>
        <span class="post-meta">
            {{ writeup.date | date: "%B %d, %Y" }} | {{ writeup.event }} | {{ writeup.difficulty }}
        </span>
    </li>
    {% endfor %}
</ul>