---
layout: default
title: Git多账号管理工具
---

# Git 多账号管理工具

在日常开发中，我们经常需要在多个 GitHub 账号之间切换。为了简化这个过程，我写了一个简单的 Bash 脚本工具 `git-account.sh`。

## 功能介绍

- 查看当前 Git 账号状态
- 保存和管理多个账号配置
- 快速切换账号
- 设置远程仓库地址

## 使用方法

### 查看当前状态

```bash
./git-account.sh status
```

输出示例：
```
=== 当前 Git 账号状态 ===
全局配置:
  用户名: user1
  邮箱: user1@example.com
本地配置:
  用户名: user2
  邮箱: user2@example.com
  远程仓库: git@github.com:user2/repo.git
```

### 添加新账号

```bash
./git-account.sh add
```

按提示输入账号别名、用户名和邮箱即可保存。

### 列出已保存账号

```bash
./git-account.sh list
```

### 切换账号

```bash
./git-account.sh switch 账号别名
```

### 设置远程仓库

```bash
./git-account.sh remote https://github.com/user/repo.git
```

## 总结

这个工具虽然简单，但能有效解决多账号切换的烦恼。配合 SSH config 多密钥配置，可以实现不同项目使用不同 GitHub 账号的需求。
