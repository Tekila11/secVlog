---
layout: default
title: Home
---

<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <h2>Latest Writeups</h2>
        <ul>
            {% for writeup in site.writeups limit:5 %}
            <li><a href="/secVlog{{ writeup.url }}">{{ writeup.title }}</a></li>
            {% endfor %}
        </ul>

        <h2>Latest Articles</h2>
        <ul>
            {% for article in site.articles limit:5 %}
            <li><a href="/secVlog{{ article.url }}">{{ article.title }}</a></li>
            {% endfor %}
        </ul>
    </aside>

    <main class="main-content">
        {% assign latest_writeup = site.writeups | sort: "date" | last %}
        {% assign latest_article = site.articles | sort: "date" | last %}

        {% if latest_writeup.date > latest_article.date %}
            <!-- Display Latest Writeup -->
            <div class="featured-article">
                <h2>{{ latest_writeup.title }}</h2>
                <div class="post-meta">
                    <span class="date">{{ latest_writeup.date | date: "%B %d, %Y" }}</span>
                    {% if latest_writeup.event %}
                        <span class="event">{{ latest_writeup.event }}</span>
                    {% endif %}
                    {% if latest_writeup.difficulty %}
                        <span class="difficulty">{{ latest_writeup.difficulty }}</span>
                    {% endif %}
                </div>
                <div class="tags">
                    {% for tag in latest_writeup.tags %}
                    <a href="/secVlog/tags/{{ tag }}" class="tag">#{{ tag }}</a>
                    {% endfor %}
                </div>
                <p>{{ latest_writeup.excerpt | default: latest_writeup.content | strip_html | truncate: 200 }}</p>
                <a href="/secVlog{{ latest_writeup.url }}" class="view-all">Read More →</a>
            </div>
        {% else %}
            <!-- Display Latest Article -->
            <div class="featured-article">
                <h2>{{ latest_article.title }}</h2>
                <div class="post-meta">
                    <span class="date">{{ latest_article.date | date: "%B %d, %Y" }}</span>
                    <span class="read-time">{{ latest_article.content | number_of_words | divided_by: 180 | plus: 1 }} min read</span>
                </div>
                <div class="tags">
                    {% for tag in latest_article.tags %}
                    <a href="/secVlog/tags/{{ tag }}" class="tag">#{{ tag }}</a>
                    {% endfor %}
                </div>
                <p>{{ latest_article.excerpt | default: latest_article.content | strip_html | truncate: 400 }}</p>
                <a href="/secVlog{{ latest_article.url }}" class="view-all">Read More →</a>
            </div>
        {% endif %}
    </main>
</div>