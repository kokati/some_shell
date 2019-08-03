#!/bin/sh

PREFIX=/usr

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/share/youdao-dict
mkdir -p $PREFIX/share/applications
mkdir -p $PREFIX/share/dbus-1/services
mkdir -p $PREFIX/share/icons/hicolor/48x48/apps
mkdir -p $PREFIX/share/icons/hicolor/scalable/apps
mkdir -p /etc/xdg/autostart
cp -r src/* $PREFIX/share/youdao-dict
cp -r data/hicolor/* $PREFIX/share/icons/hicolor/
cp data/youdao-dict.desktop $PREFIX/share/applications/
cp data/youdao-dict-autostart.desktop /etc/xdg/autostart/
cp data/com.youdao.backend.service $PREFIX/share/dbus-1/services/
chmod 755 $PREFIX/share/youdao-dict/main.py
chmod 755 $PREFIX/share/youdao-dict/youdao-dict-backend.py
BIN_PATH=$PREFIX/bin/youdao-dict
[ -e $BIN_PATH ] && rm -f $BIN_PATH
ln -sf $PREFIX/share/youdao-dict/main.py $BIN_PATH
