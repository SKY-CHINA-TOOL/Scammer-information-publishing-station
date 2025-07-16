# Vercel 部署指南

## 已完成的配置

1. 已更新 `vercel.json` 配置文件，优化了构建和缓存设置
2. 已确认 `package.json` 中包含了 `vercel-build` 脚本

## 部署步骤

### 方法一：使用Vercel CLI（命令行工具）

1. 安装 Vercel CLI：
   ```bash
   npm install -g vercel
   ```

2. 登录到您的Vercel账户：
   ```bash
   vercel login
   ```

3. 在项目根目录下运行以下命令进行部署：
   ```bash
   vercel
   ```

4. 按照提示完成部署配置：
   - 是否链接到已有项目？如果是第一次部署，选择"否"
   - 项目名称：可以使用默认名称或自定义
   - 是否要覆盖配置？选择"否"，因为我们已经有了vercel.json
   - 构建命令：将自动使用package.json中的vercel-build脚本
   - 输出目录：将自动使用vercel.json中配置的public目录

5. 部署完成后，Vercel会提供一个预览URL，您可以访问该URL查看部署效果

### 方法二：通过Vercel网站部署

1. 访问 [Vercel官网](https://vercel.com) 并登录您的账户

2. 点击 "Add New..." > "Project"

3. 导入您的GitHub仓库：
   - 如果您的仓库已经连接到Vercel，直接选择该仓库
   - 如果没有，点击 "Import Git Repository" 并授权Vercel访问您的GitHub账户

4. 配置项目：
   - 项目名称：可以使用默认名称或自定义
   - 框架预设：选择 "Other"
   - 构建命令：将自动使用package.json中的vercel-build脚本
   - 输出目录：将自动使用vercel.json中配置的public目录

5. 点击 "Deploy" 按钮开始部署

6. 部署完成后，Vercel会提供一个域名，您可以通过该域名访问您的网站

## 自定义域名设置

1. 在Vercel仪表板中，选择您的项目

2. 点击 "Settings" > "Domains"

3. 添加您的自定义域名，并按照提示进行DNS配置

4. 等待DNS生效后，您的网站将可以通过自定义域名访问

## 自动部署设置

Vercel会自动监听您的GitHub仓库变化，每次推送到主分支时都会自动部署。如果您想更改这一行为：

1. 在Vercel仪表板中，选择您的项目

2. 点击 "Settings" > "Git"

3. 在 "Production Branch" 部分，您可以更改用于生产环境的分支

4. 在 "Ignored Build Step" 部分，您可以设置何时跳过构建

## 环境变量设置

如果您的项目需要环境变量：

1. 在Vercel仪表板中，选择您的项目

2. 点击 "Settings" > "Environment Variables"

3. 添加所需的环境变量

## 常见问题排查

1. 如果构建失败：
   - 检查构建日志以获取错误信息
   - 确保所有依赖都已正确安装
   - 验证vercel-build脚本是否正确

2. 如果部署成功但网站无法访问：
   - 检查输出目录是否正确（应为public）
   - 检查是否有路由配置错误

3. 如果静态资源（如图片、CSS）无法加载：
   - 确保资源路径正确
   - 检查vercel.json中的路由配置 