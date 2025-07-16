# Kevin的博客

这是一个基于 Hexo 的个人博客项目。

## 部署方式

### GitHub Pages 部署

1. 修改 `_config.yml` 文件中的 Git 部署配置：

```yaml
deploy:
  - type: git
    repo: https://github.com/用户名/用户名.github.io.git
    branch: main
    message: "网站更新: {{now('YYYY-MM-DD HH:mm:ss')}}"
    name: 您的GitHub用户名
    email: 您的邮箱
```

2. 运行部署命令：

```bash
hexo clean && hexo deploy
```

### Vercel 部署

1. 在 Vercel 上创建新项目
2. 导入此 Git 仓库
3. 构建命令会自动使用 `vercel-build` 脚本
4. 部署目录设置为 `public`

## 本地开发

```bash
# 安装依赖
pnpm install

# 启动开发服务器
hexo server

# 或指定端口
hexo server -p 6000
```

## 创建新文章

```bash
hexo new "文章标题"
``` 