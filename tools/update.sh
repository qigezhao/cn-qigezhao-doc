#!/bin/bash
# install

GROUP_NAME="cn_qigezhao"
PROC_NAME="doc"

APP_NAME="cn-qigezhao-doc"
REPO_DIR="/repo/$APP_NAME"
WWW_DIR="/www/$APP_NAME"

GIT_URL="https://gitee.com/qigezhao_cn/cn-qigezhao-doc.git"


echo "Updating $APP_NAME..."
mkdir -p $REPO_DIR
cd $REPO_DIR
git pull --rebase
cd $APP_NAME
mkdir -p $WWW_DIR
cd $WWW_DIR
cp -rf www/* $WWW_DIR
