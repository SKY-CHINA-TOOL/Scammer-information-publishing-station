#!/bin/bash
# 部署到 GitHub Pages 的脚本

echo "开始部署到 GitHub Pages..."
hexo clean && hexo deploy
echo "部署完成！" 