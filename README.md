# NOCK介绍
- POW机制 总量为2^32个 约42亿左右
- 刚开始只支持CPU，后面会支持GPU
- 初始主网一个区块10分钟 区块奖励65536（减半机制）
- 每 2 周进行一次难度重定向，初始区块大小为 1MB

#  配置要求(Ubuntu系统)
- 16GB RAM
- 50-200GB SSD
- 6核或者更高
- CPU越多 算力越高 产出越多

# 教程
# 第一步 安装环境配置
```
apt-get update && apt install sudo
```
```
sudo apt install screen curl iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y
```
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
```
source $HOME/.cargo/env
```
```
rustup default stable
```
# 拉取NOCK仓库
```
git clone https://github.com/zorp-corp/nockchain
cd nockchain
```
```
make install-choo
```
```
make build-hoon-all
make build
```
- 这步需要等待长时间安装(15分钟)
- 耐心等待 千万不要退出

# 创建钱包
```
echo 'export PATH="$PATH:/root/nockchain/target/release"' >> ~/.bashrc
source ~/.bashrc
```
```
wallet keygen
```
- 记得保存助记词

# 运行leader节点

```
screen -S leader
```
```
make run-nockchain-leader
```
# 运行follower节点
```
screen -S follower
```
```
make run-nockchain-follower
```
