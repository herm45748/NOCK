#!/bin/bash

set -e

echo "[1/5] 更新系统并安装依赖..."
sudo apt-get update
sudo apt install -y sudo screen curl iptables build-essential git wget lz4 jq make gcc nano \
automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang \
bsdmainutils ncdu unzip libleveldb-dev

echo "[2/5] 安装 Rust 环境..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "[3/5] 加载 Rust 环境..."
source $HOME/.cargo/env

# 确保在新的终端会话中也能自动加载环境变量
if [[ -f ~/.bashrc ]]; then
  echo 'source $HOME/.cargo/env' >> ~/.bashrc
elif [[ -f ~/.zshrc ]]; then
  echo 'source $HOME/.cargo/env' >> ~/.zshrc
elif [[ -f ~/.config/fish/config.fish ]]; then
  echo 'source $HOME/.cargo/env.fish' >> ~/.config/fish/config.fish
elif [[ -f ~/.config/nu/config.nu ]]; then
  echo 'source $"($nu.home-path)/.cargo/env.nu"' >> ~/.config/nu/config.nu
fi

echo "[4/5] 设置 Rust 为 stable 版本..."
rustup default stable

echo "[5/5] 克隆 nockchain 仓库..."
git clone https://github.com/zorp-corp/nockchain

echo "所有步骤完成！"
