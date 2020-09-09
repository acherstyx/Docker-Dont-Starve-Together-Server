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

- cluster_token.txt

  包含了连接官方所使用的Token。

- cluster.ini

  包含一些通用的服务器配置内容。

- delicated_server_mods_setup.lua

  服务器的mod配置，用来添加mod。

- adminlist.txt

  管理员的ID列表，管理员可以使用远程控制台。

- whitelist.txt

  白名单列表，和cluster.ini中的whitelist_slots配置的人数对应，为白名单中的用户保留的游戏位置，从而保证白名单中的用户可以进入服务器。

- blocklist.txt

  黑名单，用来Ban用户。

- Master/Caves文件夹

  - server.ini

    主世界和洞穴的独立配置文件。

  - worldgenoverride.lua

    分别为主世界和洞穴世界生成的配置文件。

  - modoverrides.lua

    mod的配置文件，主世界和洞穴使用同一份即可。
