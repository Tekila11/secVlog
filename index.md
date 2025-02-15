---
layout: default
title: Home
---

# Welcome to secVlog Blog

<div class="home">
    <section class="latest-writeups">
        <h2>Latest CTF Writeups</h2>
        <div class="post-grid">
            {% for writeup in site.writeups limit:3 %}
            <div class="post-card">
                <h3><a href="/secVlog{{ writeup.url }}">{{ writeup.title }}</a></h3>
                <div class="post-meta">
                    <span class="date">{{ writeup.date | date: "%B %d, %Y" }}</span>
                    <span class="event">{{ writeup.event }}</span>
                    <span class="difficulty">{{ writeup.difficulty }}</span>
                </div>
                <div class="tags">
                    {% for tag in writeup.tags limit:3 %}
                    <a href="/secVlog/tags/{{ tag }}" class="tag">#{{ tag }}</a>
                    {% endfor %}
                </div>
            </div>
            {% endfor %}
        </div>
        <a href="/secVlog/writeups" class="view-all">View all writeups →</a>
    </section>

<section class="latest-articles">
        <h2>Latest Articles</h2>
        <div class="post-grid">
            {% for article in site.articles limit:3 %}
            <div class="post-card">
                <h3><a href="/secVlog{{ article.url }}">{{ article.title }}</a></h3>
                <div class="post-meta">
                    <span class="date">{{ article.date | date: "%B %d, %Y" }}</span>
                    <span class="read-time">{{ article.content | number_of_words | divided_by: 180 | plus: 1 }} min read</span>
                </div>
                <div class="tags">
                    {% for tag in article.tags limit:3 %}
                    <a href="/secVlog/tags/{{ tag }}" class="tag">#{{ tag }}</a>
                    {% endfor %}
                </div>
            </div>
            {% endfor %}
        </div>
        <a href="/secVlog/articles" class="view-all">View all articles →</a>
    </section>
    <section class="featured-section">
    <div class="featured-card">
        <h3>Latest Writeup: Web Exploitation</h3>
        <div class="post-meta">
            <span class="date">February 15, 2025</span>
            <span class="event">Example CTF 2025</span>
            <span class="difficulty">Medium</span>
        </div>
        <div class="tags">
            <a href="/secVlog/tags/web" class="tag">#Web</a>
            <a href="/secVlog/tags/exploitation" class="tag">#Exploitation</a>
            <a href="/secVlog/tags/cookies" class="tag">#Cookies</a>
        </div>
    </div>
    <div class="featured-card">
        <h3>Latest Article: Introduction to Web Security</h3>
        <div class="post-meta">
            <span class="date">February 15, 2025</span>
            <span class="read-time">2 min read</span>
        </div>
        <div class="tags">
            <a href="/secVlog/tags/security" class="tag">#Security</a>
            <a href="/secVlog/tags/web" class="tag">#Web</a>
            <a href="/secVlog/tags/best-practices" class="tag">#Best Practices</a>
        </div>
    </div>
</section>
</div>