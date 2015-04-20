docker-pocketmine-mp
====================

Docker image for a PocketMine-MP server.
Since it includes the latest stable version of PocketMine-MP that is not working with the latest Minecraft PE, you should update to the latest beta. Check "Update Beta" section.

**For the moment, installing beta release instead of stable one by default.**

Quick Start
--------------------

```
docker run --name=pocketmine-mp -d -p 19132:19132/udp da9l/pocketmine-mp:latest
```

Data Persistence
--------------------

You might want to keep your data from losing.
The easiest way is to create a direcory on host filesystem and mount it to `/usr/local/pocketmine-mp` in a container.

```
mkdir /opt/pocketmine-mp
```

```
docker run --name=pocketmine-mp -d -v /opt/pocketmine-mp:/usr/local/pocketmine-mp \
    -p 19132:19132/udp da9l/pocketmine-mp:latest
```

You can also edit `server.properties`. 

Update
--------------------

Set the environment variable `UPDATE_LATEST = YES` to force update the latest stable release.

```
docker run --name=pocketmine-mp -d -v /opt/pocketmine-mp:/usr/local/pocketmine-mp \
    -p 19132:19132/udp -e "UPDATE_LATEST=YES" da9l/pocketmine-mp:latest
```

Update Beta
--------------------

Set the environment variable `UPDATE_LATEST_BETA = YES` to force update the latest beta release.

```
docker run --name=pocketmine-mp -d -v /opt/pocketmine-mp:/usr/local/pocketmine-mp \
    -p 19132:19132/udp -e "UPDATE_LATEST_BETA=YES" da9l/pocketmine-mp:latest
```

Update Dev
--------------------

Set the environment variable `UPDATE_LATEST_DEV = YES` to force update the latest development release.

```
docker run --name=pocketmine-mp -d -v /opt/pocketmine-mp:/usr/local/pocketmine-mp \
    -p 19132:19132/udp -e "UPDATE_LATEST_DEV=YES" da9l/pocketmine-mp:latest
```

http://sourceforge.net/projects/mcrcon/
