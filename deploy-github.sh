#!/bin/bash
# 部署到 GitHub Pages 的脚本

echo "开始部署到 GitHub Pages..."

# 确保工作目录干净
echo "清理和生成站点..."
hexo clean && hexo generate --config _config.yml,_config.prod.yml

# 部署到GitHub
echo "部署到GitHub Pages..."
hexo deploy --config _config.yml,_config.prod.yml

# 检查部署是否成功
if [ $? -eq 0 ]; then
  echo "✅ 部署成功！"
  echo "您的网站应该很快就能在 https://sky-china-tool.github.io/Scammer-information-publishing-station/ 上访问"
else
  echo "❌ 部署失败，请检查错误信息"
  exit 1
fi 