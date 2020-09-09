# 配置文件

```shell
~$ tree config --dirsfirst
./
├── Caves
│   ├── modoverrides.lua
│   ├── server.ini
│   └── worldgenoverride.lua
├── Master
│   ├── modoverrides.lua
│   ├── server.ini
│   └── worldgenoverride.lua
├── adminlist.txt
├── cluster.ini
├── cluster_token.txt
├── dedicated_server_mods_setup.lua
└── README.md
```

## cluster_token.txt

  包含了连接官方所使用的Token。

```txt
pds-xxxxxxxxxxxxxxxxxxxxx
```

## cluster.ini

  包含一些通用的服务器配置内容。

```ini
[MISC]
max_snapshots =20       # 最大快照数
console_enabled = true  # 是否开启控制台
  
[SHARD]
shard_enabled = true
bind_ip = 127.0.0.1
master_ip = 127.0.0.1
master_port = 11001
cluster_key = dst
  
[STEAM]     # steam群组设置
steam_group_only = false
steam_group_id = 0
steam_group_admins = false

[NETWORK]
offline_server = false      # 离线服务器（局域网访问）
tick_rate = 15              # 每秒通信次数，越高游戏体验越好，但是服务器负担越重
whitelist_slots = 2         # 为白名单用户保留的游戏位
cluster_intention = cooperative
lan_only_cluster = false    # 局域网游戏

cluster_name = DST-Docker-Test          # 房间名
cluster_description = A test server     # 房间描述
cluster_password =                      # 房间密码

[GAMEPLAY]
max_players = 16            # 最大游戏人数
pvp = false                 # 是否开启pvp
game_mode = endless         # 游戏模式 （survival, endless， wilderness）
pause_when_empty = true     # 无人时暂停游戏
vote_kick_enabled = true    # 投票踢人
```

## delicated_server_mods_setup.lua

  服务器的mod配置，用来添加mod。

## adminlist.txt

  管理员的ID列表，管理员可以使用远程控制台。

```txt
KU_xxxxxxxx
```

## whitelist.txt

  白名单列表，和cluster.ini中的whitelist_slots配置的人数对应，为白名单中的用户保留的游戏位置，从而保证白名单中的用户可以进入服务器。

```txt
KU_xxxxxxxx
```

## blocklist.txt

  黑名单，用来Ban用户。

```txt
KU_xxxxxxxx
```

## Master/Caves文件夹

### server.ini

主世界和洞穴的独立配置文件。

```ini
[SHARD]
is_master = true /false      # 是否是 master 服务器，只能存在一个 true，其他全是 false
name = caves                 # 非master服务器的名称
id = ???                     # 随机生成，不用写

[STEAM]
authentication_port = 8766   # Steam 用的端口，确保每个实例都不相同
master_server_port = 27016   # Steam 用的端口，确保每个实例都不相同

[NETWORK]
server_port = 10999          # 监听的 UDP 端口，只能介于 10998 - 11018 之间，确保每个实例都不相同
```

### worldgenoverride.lua

分别为主世界和洞穴世界生成的配置文件。

### modoverrides.lua

mod的配置文件，主世界和洞穴使用同一份即可。
