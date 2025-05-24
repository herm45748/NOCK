#!/bin/bash

set -e

echo "[1/5] 更新系统并安装依赖..."
sudo apt-get update
sudo apt install -y sudo screen curl iptables build-essential git wget lz4 jq make gcc nano \
automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang \
bsdmainutils ncdu unzip libleveldb-dev

