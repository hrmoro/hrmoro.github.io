#!/bin/bash
# GitHub 多账号管理工具

CONFIG_FILE="$HOME/.git-accounts"

show_current() {
    echo "=== 当前 Git 账号状态 ==="
    echo "全局配置:"
    echo "  用户名: $(git config --global user.name 2>/dev/null || echo '未设置')"
    echo "  邮箱: $(git config --global user.email 2>/dev/null || echo '未设置')"
    if [ -d .git ]; then
        echo "本地配置:"
        echo "  用户名: $(git config --local user.name 2>/dev/null || echo '未设置')"
        echo "  邮箱: $(git config --local user.email 2>/dev/null || echo '未设置')"
        echo "  远程仓库: $(git config --local remote.origin.url 2>/dev/null || echo '未设置')"
    fi
}

list_accounts() {
    echo "=== 已保存的账号 ==="
    if [ -f "$CONFIG_FILE" ]; then
        cat "$CONFIG_FILE"
    else
        echo "暂无保存的账号"
    fi
}

add_account() {
    read -p "账号别名: " alias
    read -p "用户名: " name
    read -p "邮箱: " email
    echo "$alias|$name|$email" >> "$CONFIG_FILE"
    echo "账号 '$alias' 已添加"
}

switch_account() {
    local alias=$1
    if [ -z "$alias" ]; then
        list_accounts
        read -p "输入要切换的账号别名: " alias
    fi
    local line=$(grep "^$alias|" "$CONFIG_FILE" 2>/dev/null)
    if [ -z "$line" ]; then
        echo "账号 '$alias' 不存在"
        return 1
    fi
    local name=$(echo "$line" | cut -d'|' -f2)
    local email=$(echo "$line" | cut -d'|' -f3)
    git config --local user.name "$name"
    git config --local user.email "$email"
    echo "已切换到账号: $name <$email>"
}

set_remote() {
    local url=$1
    if [ -z "$url" ]; then
        read -p "输入远程仓库URL: " url
    fi
    git remote set-url origin "$url" 2>/dev/null || git remote add origin "$url"
    echo "远程仓库已设置为: $url"
}

case "$1" in
    status|s)   show_current ;;
    list|l)     list_accounts ;;
    add|a)      add_account ;;
    switch|sw)  switch_account "$2" ;;
    remote|r)   set_remote "$2" ;;
    *)
        echo "用法: $0 <命令>"
        echo "命令:"
        echo "  status, s    - 查看当前账号状态"
        echo "  list, l      - 列出已保存账号"
        echo "  add, a       - 添加新账号"
        echo "  switch, sw   - 切换账号"
        echo "  remote, r    - 设置远程仓库"
        ;;
esac
