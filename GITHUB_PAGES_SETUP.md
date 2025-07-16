# GitHub Pages 设置指南

## 已完成的配置

1. 已修改 `_config.yml` 中的部署配置，指向您的GitHub仓库
2. 已更新 `deploy-github.sh` 脚本，添加了更详细的部署步骤
3. 已创建 GitHub Actions 工作流配置文件，用于自动部署

## 需要您手动完成的步骤

1. 将更改推送到GitHub仓库：
   ```bash
   git add .
   git commit -m "配置GitHub Pages部署"
   git push
   ```

2. 在GitHub仓库中启用GitHub Pages：
   - 访问您的仓库：https://github.com/SKY-CHINA-TOOL/Scammer-information-publishing-station
   - 点击 "Settings" 选项卡
   - 在左侧菜单中找到 "Pages"
   - 在 "Build and deployment" 部分：
     - Source: 选择 "Deploy from a branch"
     - Branch: 选择 "gh-pages" 分支和 "/(root)" 文件夹
     - 点击 "Save"

3. 检查GitHub Actions工作流是否正常运行：
   - 在您的仓库中点击 "Actions" 选项卡
   - 查看是否有名为 "部署到GitHub Pages" 的工作流正在运行或已完成

4. 访问您的GitHub Pages网站：
   - 您的网站应该可以通过以下URL访问：
   - https://sky-china-tool.github.io/Scammer-information-publishing-station/

## 可能需要的其他配置

1. 如果您想使用自定义域名：
   - 在仓库的 "Settings" > "Pages" 中的 "Custom domain" 部分添加您的域名
   - 在您的DNS提供商处添加相应的DNS记录
   - 在项目的 `source` 目录下创建一个名为 `CNAME` 的文件，内容为您的自定义域名

2. 如果您需要使用HTTPS：
   - 启用自定义域名后，勾选 "Enforce HTTPS" 选项

## 手动部署方法

除了GitHub Actions自动部署外，您也可以手动部署：

```bash
# 使用脚本部署
./deploy-github.sh

# 或者直接运行Hexo命令
hexo clean && hexo deploy
```

## 常见问题排查

1. 如果部署失败，检查以下内容：
   - 确保 `hexo-deployer-git` 插件已安装
   - 检查GitHub仓库的访问权限是否正确
   - 查看GitHub Actions日志中的错误信息

2. 如果网站无法访问：
   - 确保gh-pages分支已创建并包含生成的网站文件
   - 检查GitHub Pages设置是否正确配置为使用gh-pages分支
   - 等待几分钟，GitHub Pages的更新可能需要一些时间 