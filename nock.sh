#!/bin/bash

set -e

echo "[1/5] 更新系统并安装依赖..."
sudo apt-get update
sudo apt install -y sudo screen curl iptables build-essential git wget lz4 jq make gcc nano \
automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang \
bsdmainutils ncdu unzip libleveldb-dev

echo "[2/5] 安装 Rust 环境..."
if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; then
  echo "Rust 安装失败，请检查网络连接或手动安装。"
  exit 1
fi

echo "[3/5] 加载 Rust 环境..."
source $HOME/.cargo/env
if ! command -v rustup &> /dev/null; then
  echo "Rust 环境未正确加载，请检查。"
  exit 1
fi

echo "[4/5] 设置 Rust 为 stable 版本..."
rustup default stable
if ! rustup show active-toolchain | grep -q "stable"; then
  echo "Rust 版本设置失败，请检查。"
  exit 1
fi

echo "[5/5] 克隆 nockchain 仓库..."
git clone https://github.com/zorp-corp/nockchain
if [ ! -d "nockchain" ]; then
  echo "克隆仓库失败，请检查网络连接或手动克隆。"
  exit 1
fi

echo "所有步骤完成！"

