# 简要 `gitbook-cli` 安装及使用方法

## 安装及初始化
```
cd ./doc
sudo npm install -g gitbook-cli
gitbook init
```

## 部署与导出
```
gitbook serve --port 8080
gitbook build
```

## 核心配置文件
官方文档：[https://toolchain.gitbook.com/config.html](!https://toolchain.gitbook.com/config.html)
* `README.md` 简介
* `SUMMARY.md` 电子书结构文件，可以通过`gitbook ini`自动生成各级目录及文件
* `book.json` 配置文件，用于个性化调整（可选）
* `GLOSSARY.md` 默认的词汇表（可选）
* `LANGS.md` 默认的语言文件（可选）