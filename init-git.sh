#!/bin/bash
# 初始化 Git 仓库并推送到 GitHub

# 替换以下变量为您的实际值
GIT_REPO="https://github.com/用户名/仓库名.git"
GIT_USERNAME="您的GitHub用户名"
GIT_EMAIL="您的邮箱"

echo "初始化 Git 仓库..."
git init
git config user.name "$GIT_USERNAME"
git config user.email "$GIT_EMAIL"

echo "添加文件到暂存区..."
git add .

echo "提交更改..."
git commit -m "初始化博客"

echo "添加远程仓库..."
git remote add origin $GIT_REPO

echo "推送到 GitHub..."
git push -u origin main

echo "完成！" 