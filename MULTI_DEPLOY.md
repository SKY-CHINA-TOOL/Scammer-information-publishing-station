# 多环境部署说明

本项目配置了两个不同的部署环境：GitHub Pages和Vercel。每个环境使用不同的域名和路径配置，以确保在各自环境中正常显示。

## 配置文件说明

- `_config.yml`: 基本配置文件，默认使用Vercel配置
- `_config.prod.yml`: GitHub Pages环境特定配置，覆盖基本配置中的URL和root设置
- `_config.vercel.yml`: Vercel环境特定配置，覆盖基本配置中的URL和root设置

## 部署方法

### 部署到GitHub Pages

使用以下命令部署到GitHub Pages：

```bash
./deploy-github.sh
```

或者手动执行：

```bash
hexo clean && hexo generate --config _config.yml,_config.prod.yml
hexo deploy --config _config.yml,_config.prod.yml
```

部署后，网站将可通过以下地址访问：
https://sky-china-tool.github.io/Scammer-information-publishing-station/

### 部署到Vercel

使用以下命令部署到Vercel：

```bash
./deploy-vercel.sh
```

或者手动执行：

```bash
hexo clean && hexo generate --config _config.yml,_config.vercel.yml
vercel --prod
```

部署后，网站将可通过以下地址访问：
https://sky-pianzi.kevcore.cn

## 自动部署

- **GitHub Pages**: 通过GitHub Actions自动部署，每次推送到main分支时触发
- **Vercel**: 通过Vercel自动部署，每次推送到仓库时触发

## 注意事项

1. 修改网站内容后，需要同时部署到两个环境才能保持一致
2. 如果修改了URL或路径相关的配置，请确保同时更新相应的环境配置文件
3. 如果添加了新的资源文件，确保它们在两个环境中都能正确加载 