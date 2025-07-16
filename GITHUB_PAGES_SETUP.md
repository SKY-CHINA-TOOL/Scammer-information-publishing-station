# GitHub Pages 设置指南

## 已完成的配置

1. 已修改 `_config.yml` 中的部署配置，指向您的GitHub仓库
2. 已更新 `deploy-github.sh` 脚本，添加了更详细的部署步骤
3. 已创建 GitHub Actions 工作流配置文件，用于自动部署
4. 已添加solitude主题作为Git子模块
5. 已添加GitHub Actions所需的权限配置

## 需要您手动完成的步骤（组织仓库）

1. 在组织仓库中启用GitHub Pages：
   - 访问您的仓库：https://github.com/SKY-CHINA-TOOL/Scammer-information-publishing-station/settings/pages
   - 在 "Build and deployment" 部分：
     - Source: 选择 "Deploy from a branch"
     - Branch: 选择 "gh-pages" 分支和 "/(root)" 文件夹
     - 点击 "Save"

2. 确保GitHub Actions有适当的权限：
   - 访问组织设置：https://github.com/organizations/SKY-CHINA-TOOL/settings/actions
   - 在 "Policies" 选项卡下：
     - 确保 "Allow all actions and reusable workflows" 被选中
     - 或者至少允许 "peaceiris/actions-gh-pages" 和其他必要的操作

3. 为仓库配置特定的权限：
   - 访问仓库设置：https://github.com/SKY-CHINA-TOOL/Scammer-information-publishing-station/settings/actions
   - 在 "Workflow permissions" 部分：
     - 选择 "Read and write permissions"
     - 勾选 "Allow GitHub Actions to create and approve pull requests"
     - 点击 "Save"

4. 检查组织的GitHub Actions权限：
   - 访问组织设置：https://github.com/organizations/SKY-CHINA-TOOL/settings/actions
   - 在 "General" 选项卡下，确保没有限制会阻止Actions运行
   - 如有必要，在 "Runner groups" 选项卡下检查运行器权限

5. 检查GitHub Actions工作流是否正常运行：
   - 在您的仓库中点击 "Actions" 选项卡
   - 查看是否有名为 "部署到GitHub Pages" 的工作流正在运行或已完成

6. 访问您的GitHub Pages网站：
   - 您的网站应该可以通过以下URL访问：
   - https://sky-china-tool.github.io/Scammer-information-publishing-station/

## 可能需要的其他配置

1. 如果您想使用自定义域名：
   - 在仓库的 "Settings" > "Pages" 中的 "Custom domain" 部分添加您的域名
   - 在您的DNS提供商处添加相应的DNS记录
   - 在项目的 `source` 目录下创建一个名为 `CNAME` 的文件，内容为您的自定义域名

2. 如果您需要使用HTTPS：
   - 启用自定义域名后，勾选 "Enforce HTTPS" 选项

## 使用个人访问令牌(PAT)部署（如果上述方法不起作用）

如果组织设置中的权限配置仍然不能解决问题，您可以使用个人访问令牌(PAT)：

1. 创建个人访问令牌：
   - 访问 https://github.com/settings/tokens
   - 点击 "Generate new token"
   - 选择 "repo" 权限
   - 生成并复制令牌

2. 在仓库中添加密钥：
   - 访问仓库设置：https://github.com/SKY-CHINA-TOOL/Scammer-information-publishing-station/settings/secrets/actions
   - 点击 "New repository secret"
   - 名称设为 "PAT"
   - 值设为您刚才创建的个人访问令牌
   - 点击 "Add secret"

3. 修改GitHub Actions工作流文件：
   ```yaml
   - name: 部署到GitHub Pages
     uses: peaceiris/actions-gh-pages@v3
     with:
       personal_token: ${{ secrets.PAT }}  # 使用PAT而不是GITHUB_TOKEN
       publish_dir: ./public
       publish_branch: gh-pages
   ```

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

3. 如果遇到权限错误（403 Forbidden）：
   - 确保GitHub Actions有适当的权限（见上述步骤）
   - 检查组织的访问控制设置
   - 考虑使用个人访问令牌(PAT)方法 