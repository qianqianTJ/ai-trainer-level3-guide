#!/usr/bin/env bash

# 在终端中显示开始信息
echo "尝试启动 Jupyter Notebook..."

# 检查 'jupyter' 命令是否存在并尝试启动
if command -v jupyter >/dev/null 2>&1; then
    echo "发现 'jupyter' 命令，正在使用 'jupyter notebook' 启动..."
    # 使用 & 符号让 Jupyter 在后台运行，这样脚本可以继续执行，终端可以用于其他操作
    # 但如果希望Jupyter的日志显示在当前终端，可以移除 &
    jupyter notebook
else
    echo "'jupyter' 命令未找到或启动失败。尝试使用 'python3 -m notebook' 启动..."
    # 检查 'python3' 命令是否存在
    if command -v python3 >/dev/null 2>&1; then
        echo "发现 'python3' 命令，正在使用 'python3 -m notebook' 启动..."
        python3 -m notebook
    else
        echo "错误：未找到 'python3' 命令。"
        echo "请确认 Python 3 已正确安装，并且其路径已添加到你的 PATH 环境变量中。"
        echo "如果 Python 3 已安装，请尝试在终端中手动运行以下命令："
        echo "  python3 -m notebook"
    fi
fi

echo "" # 打印一个空行以增加可读性
echo "Jupyter Notebook 启动尝试结束。"
echo "如果 Jupyter Notebook 已成功启动，请在浏览器中查看。"
echo "如果在当前终端启动，此终端会一直运行直到你关闭它或停止 Jupyter。"
read -n 1 -s -r -p "请按任意键退出此脚本的终端窗口..." # 等待用户按键，然后关闭终端窗口

# 退出脚本
exit 0
