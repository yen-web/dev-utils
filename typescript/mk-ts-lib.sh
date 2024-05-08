#!/bin/bash

# 检查是否有输入参数
if [ $# -eq 0 ]; then
    echo "name empty"
    exit 1
fi

DIRECTORY="./$1"

# 检查目标文件夹是否已经存在
if [ -d "$DIRECTORY" ]; then
    echo "$DIRECTORY 已存在"
    exit 1
fi

# 检查git是否安装，如果没有安装则退出脚本
which git &> /dev/null || {
    echo "git 未安装，正在安装..."
    sudo apt update && sudo apt install -y git || exit 1
}

# 检查ts-node是否安装，如果没有安装则安装
which ts-node &> /dev/null || {
    echo "ts-node 未安装，正在安装..."
    npm i -g ts-node || exit 1
}

# 检查tsc是否安装，如果没有安装则安装
which tsc &> /dev/null || {
    echo "tsc 未安装，正在安装..."
    npm i -g typescript || exit 1
}

# 检查pnpm是否安装，如果没有安装则安装
which pnpm &> /dev/null || {
    echo "pnpm 未安装，正在安装..."
    npm i -g pnpm || exit 1
}

# 检查depcheck是否安装，如果没有安装则安装
which depcheck &> /dev/null || {
    echo "depcheck 未安装，正在安装..."
    npm i -g depcheck || exit 1
}

# 下载模板项目并移除.git文件夹
git clone https://github.com/yen-web/ts-lib-template.git "$DIRECTORY" &> /dev/null || exit 1
rm -rf "$DIRECTORY/.git"

echo "项目初始化完成"

