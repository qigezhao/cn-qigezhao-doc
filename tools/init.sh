#!/bin/bash
# install

GROUP_NAME="cn_qigezhao"
PROC_NAME="doc"

APP_NAME="cn-qigezhao-doc"
REPO_DIR="/repo/$APP_NAME"
WWW_DIR="/www/$APP_NAME"

GIT_URL="https://gitee.com/qigezhao_cn/cn-qigezhao-doc.git"



echo "Installing $APP_NAME:"
cd /tmp

echo "- updating yum..."
yum update -y

echo "- installing npm..."
yum install -y npm
echo "-- installing gitbook-cli..."
npm install -g gitbook-cli

echo "- installing supervisor..."
yum install -y supervisor
echo_supervisord_conf > supervisord.conf
echo "[includes]" >> supervisord.conf
echo "files = /etc/supervisord.d/*.ini" >> supervisord.conf
mv /etc/supervisord.conf /etc/supervisord.conf.bak
mv supervisord.conf /etc/

echo "- installing git..."
yum install -y git


echo "- installing $APP_NAME..."
mkdir -p $REPO_DIR
cd $REPO_DIR
git clone $GIT_URL
cd $APP_NAME
mkdir -p $WWW_DIR
cd $WWW_DIR
cp -rf www/* $WWW_DIR


echo "- copying configuration files of $APP_NAME..."
cd $WWW_DIR
cp -rf files/ng_$APP_NAME.conf /etc/nginx/ng_$APP_NAME.conf
cp -rf files/supervisor_$APP_NAME.ini /etc/supervisord.d/


echo "Initializing $APP_NAME..."
cd $WWW_DIR
gitbook install
gitbook init


echo
echo "----------------------------------------------------------------"
echo "[$APP_NAME] is configured and ready to start"
echo
echo "> cd $WWW_DIR && gitbook serve --port 8080"
echo
echo "> supervisord"
echo "> supervisorctl status"
echo "> supervisorctl reload"
echo "> supervisorctl restart $GROUP_NAME:$PROC_NAME"
echo
echo "> nginx"
echo "> nginx -t"
echo "> nginx -s reload"
