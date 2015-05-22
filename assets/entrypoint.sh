#!/bin/bash

cd /pocketmine/PocketMine-MP

if ! [ -e server.properties ]; then
    echo >&2 "[WARN] server.properties is not found in $(pwd). Copying from the original assets."
    cp -p ../server.properties.original server.properties
    chown pocketmine:pocketmine server.properties
fi

if ! [ -e PocketMine-MP.phar ]; then
    echo >&2 "[WARN] PocketMine-MP.phar is not found in $(pwd). Installing the latest stable release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash
    chown -R pocketmine:pocketmine /pocketmine
fi

if [ "$UPDATE_LATEST" = 'YES' ]; then
    echo "[INFO] Updating to the latest stable release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v Alpha_1.3.12
    chown -R pocketmine:pocketmine /pocketmine
fi

if [ "$UPDATE_LATEST_BETA" = 'YES' ]; then
    echo "[INFO] Updating to the latest beta release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v beta
    chown -R pocketmine:pocketmine /pocketmine
fi

if [ "$UPDATE_LATEST_DEV" = 'YES' ]; then
    echo "[INFO] Updating to the latest dev release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v development
    chown -R pocketmine:pocketmine /pocketmine
fi

wget -q -O - https://forums.pocketmine.net/plugins/essentialspe.886/download?version=1722 > /pocketmine/PocketMine-MP/plugins/EssentialsPE.phar
wget -q -o - https://forums.pocketmine.net/plugins/chatbubbles.671/download?version=1409 > /pocketmine/PocketMine-MP/plugins/chatbubbles.phar
wget -q -o - https://forums.pocketmine.net/plugins/manyworlds.1042/download?version=2145 > /pocketmine/PocketMine-MP/plugins/manyworlds.phar
wget -q -o - https://forums.pocketmine.net/plugins/worldgm.844/download?version=2073 > /pocketmine/PocketMine-MP/plugins/worldgm.phar
wget -q -o - https://forums.pocketmine.net/plugins/volt.568/download?version=1999 > /pocketmine/PocketMine-MP/plugins/volt.phar
wget -q -o - https://forums.pocketmine.net/plugins/commandsigns.958/download?version=1856 > /pocketmine/PocketMine-MP/plugins/commandsigns.phar
wget -q -o - https://forums.pocketmine.net/plugins/autoupdater.854/download?version=1700 > /pocketmine/PocketMine-MP/plugins/autoupdater.phar


#su - pocketmine "/pocketmine/PocketMine-MP/start.sh"
/pocketmine/PocketMine-MP/start.sh
