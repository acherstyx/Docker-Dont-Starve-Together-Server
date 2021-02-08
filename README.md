# Docker DST Server

通过Docker来部署和运行饥荒服务器。

## 配置

各个文件的详细配置见[config/README.md](https://github.com/AcherStyx/Docker-Dont-Starve-Together-Server/blob/master/config/README.md)。

主要的设置步骤如下：
1. 配置地上的`config/Master/worldgenoverride.lua`和洞穴的`config/Caves/worldgenoverride.lua`以设置世界，并通过修改`mods/dedicated_server_mods_setup.lua`文件以添加Mod到服务器。
2. 在`config/Master/modoverrides.lua`和`config/Caves/modoverrides.lua`（这两个文件内容应该一致）中设置启用Mod，并设置Mod的各种配置。
3. 最后修改`cluster_token.txt`，将Klei那边获取到的ID放在其中。

## 运行

通过`docker-compose up -d`运行，会将`config`和`mods`目录直接挂载到容器内，所以需要修改某些配置的时候直接在项目文件中修改，然后`docker restart dst_server`重启容器即可应用新的配置。
存档会保留在`config/Master`或`config/Caves`文件夹中，Mod则会下载在`mods`文件夹内。
