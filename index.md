---
layout: default
title: Home
---

# Welcome to secVlog Blog

<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <h2>Navigation</h2>
        <nav>
            <a href="{{ '/' | relative_url }}">Home</a>
            <a href="{{ '/writeups' | relative_url }}">Writeups</a>
            <a href="{{ '/articles' | relative_url }}">Articles</a>
            <a href="{{ '/about' | relative_url }}">About</a>
        </nav>
    </aside>

    <!-- Main Content -->
<main class="main-content">
        <div class="featured-article">
            <h2>Latest Writeup: Web Exploitation</h2>
            <div class="post-meta">
                <span class="date">February 15, 2025</span>
                <span class="event">Example CTF 2025</span>
                <span class="difficulty">Medium</span>
            </div>
            <div class="tags">
                <a href="/tags/web" class="tag">#Web</a>
                <a href="/tags/exploitation" class="tag">#Exploitation</a>
                <a href="/tags/cookies" class="tag">#Cookies</a>
            </div>
            <p>This writeup covers the "Cookie Monster" challenge from Example CTF 2025, where we exploit a vulnerability in cookie handling to gain unauthorized access.</p>
            <a href="/writeups/cookie-monster" class="view-all">Read More →</a>
        </div>
    </main>
</div>