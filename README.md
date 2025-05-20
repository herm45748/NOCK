# NOCK介绍
- POW机制 总量为2^32个 约42亿左右
- 刚开始只支持CPU，后面会支持GPU
- 初始主网一个区块10分钟 区块奖励65536（减半机制）
- 每 2 周进行一次难度重定向，初始区块大小为 1MB

#  配置要求(Ubuntu系统)
- 64GB RAM
- 50-200GB SSD


# 教程
# 第一步 安装环境配置

```
wget https://raw.githubusercontent.com/herm45748/NOCK/main/nock.sh -O nock.sh && chmod +x nock.sh && ./nock.sh

```
```
cd nockchain
```
```
make install-hoonc
```
```
make build
```
- 这步需要等待长时间安装(15分钟)
- 耐心等待 千万不要退出
```
make install-nockchain-wallet
```
```
make install-nockchain
```

# 创建钱包

```
echo 'export PATH="$PATH:/root/nockchain/target/release"' >> ~/.bashrc
echo 'export RUST_LOG=info' >> ~/.bashrc
echo 'export MINIMAL_LOG_FORMAT=true' >> ~/.bashrc
source ~/.bashrc
```

```
nockchain-wallet keygen
```
- 更改公钥地址
```
read -p "请输入你的挖矿公钥: " new_pubkey && sed -i "s|^export MINING_PUBKEY :=.*$|export MINING_PUBKEY := $new_pubkey|" Makefile
```

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

# 其他指令
- 退出screen界面

   CTRL +A+D
- 查询钱包余额

```
wallet --nockchain-socket ./test-leader/nockchain.sock balance
```
