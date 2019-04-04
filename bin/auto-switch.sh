#! /bin/bash

echo "auto-wifi-switcher is running"

HTTP_PROXY_NAME="http://学籍ID:パズワード@プロキシアドレス:ポート番号"
HTTPS_PROXY_NAME="https://学籍ID:パスワード@プロキシアドレス:ポート番号"

# ネットワーク環境名（研究室用）
LAB_NETWORK="NISlab"
# 研究室のSSID
LAB_SSID="KE-101-1"

# ネットワーク環境（プライベート用）
PRI_NETWORK=""
# SSID
PRI_SSID=""

if /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s | grep -sq "$LAB_SSID"; then
  scselect $LAB_NETWORK
  git config --global http.proxy $HTTP_PROXY_NAME
  git config --global https.proxy $HTTPS_PROXY_NAME
  git config --global url."https://".insteadOf git://

elif /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s | grep -sq "$PRI_SSID"; then
  scselect $PRI_NETWORK
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  git config --global --unset url."https://".insteadOf

else
  scselect Automatic
fi

