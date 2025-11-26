---
layout: default
title: Home
---

# hrmoro's Blog

## 文章列表

{% for post in site.posts %}
- {{ post.date | date: "%Y-%m-%d" }} [{{ post.title }}]({{ post.url }})
{% endfor %}

<script type='text/javascript' id='clustrmaps' src='//cdn.clustrmaps.com/map_v2.js?cl=080808&w=a&t=tt&d=Ep4vfr0-pwPoKermwXICCZMKj3GhQsPwUovRINdsV0w&co=ffffff&ct=808080&cmo=3acc3a&cmn=ff5353'></script>
