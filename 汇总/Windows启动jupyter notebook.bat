@echo off
chcp 65001 > nul
setlocal

echo 尝试启动 Jupyter Notebook...

rem 首先尝试直接执行 jupyter notebook 命令
where jupyter >nul 2>&1
if %errorlevel% equ 0 (
    echo 使用 jupyter notebook 命令启动...
    jupyter notebook
) else (
    echo jupyter notebook 命令未找到或失败。尝试使用 python -m notebook 启动...
    rem 验证 python 命令是否存在
    where python >nul 2>&1
    if %errorlevel% equ 0 (
        echo 使用 python -m notebook 命令启动...
        python -m notebook
    ) else (
        echo 错误：未找到 Python 命令。请确认 Python 已正确安装并添加到 PATH。
        echo 如果 Python 已安装，请尝试手动运行：
        echo 1. 打开命令提示符
        echo 2. 输入 "python -m notebook"
    )
)

echo.
echo Jupyter Notebook 启动尝试结束。
pause
endlocal
