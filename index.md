---
layout: default
title: Home
---

# hrmoro's Blog

## 文章列表

{% for post in site.posts %}
- {{ post.date | date: "%Y-%m-%d" }} [{{ post.title }}]({{ post.url }})
{% endfor %}

---

## 关于Sky光遇

你可以[访问光遇官方网站](http://sky.163.com/)了解更多信息。

光遇真的是一个很不错的游戏，目前国服貌似只有app store有，安卓机的话需要下载国际服，国服的目前可以预约，可以等今年12月份上线体验。

### Sky光遇
2012年度最佳游戏《风之旅人》制作人陈星汉历时七年新作
