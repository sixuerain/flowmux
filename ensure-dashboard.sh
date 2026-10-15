#!/bin/bash
# 确保 flowmux dashboard 窗口存在（由 tmux Ctrl+G 绑定调用）。
# 跳转由绑定里的 switch-client 完成（这里拿不到可靠的客户端上下文）。
TMUX=/usr/local/bin/tmux

# 前缀匹配 "dashboard"，避免 tmux 显示旗标或重名后缀干扰
if $TMUX list-windows -t flowmux -F '#{window_name}' 2>/dev/null | grep -q '^dashboard'; then
    exit 0
fi

$TMUX new-window -d -t flowmux -n dashboard -c /home/lhe flowmux
$TMUX set-option -t flowmux:dashboard automatic-rename off
# 无论成功与否都返回 0，避免 tmux 弹 "returned 1"
exit 0
