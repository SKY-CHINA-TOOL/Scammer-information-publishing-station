#!/bin/bash
# 部署到 Vercel 的脚本

echo "开始部署到 Vercel..."

# 确保工作目录干净
echo "清理和生成站点..."
hexo clean && hexo generate --config _config.yml,_config.vercel.yml

# 检查是否安装了vercel CLI
if ! command -v vercel &> /dev/null; then
  echo "未找到vercel命令，正在安装Vercel CLI..."
  npm install -g vercel
fi

# 部署到Vercel
echo "部署到Vercel..."
vercel --prod

# 检查部署是否成功
if [ $? -eq 0 ]; then
  echo "✅ 部署成功！"
  echo "您的网站应该很快就能在 https://sky-pianzi.kevcore.cn 上访问"
else
  echo "❌ 部署失败，请检查错误信息"
  exit 1
fi 