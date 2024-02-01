#!/bin/sh

# Time to wait before shutdown (in minutes)
shutdown_delay=15

node=/.nvm/versions/node/v20.11.0/bin/node

check_players_online() {
    players_online=$($node ./playersonline.js)
    echo $players_online
}

main() {
    minutes=0

    echo "[$(date)] Waiting for server boot"
    sleep 60

    while [ "$minutes" -lt $shutdown_delay ]; do
        sleep 60
        if [ "$(check_players_online)" == "false" ]; then
            ((minutes++))
            echo "[$(date)] No players online. Minutes: $minutes"
            continue
        fi

        minutes=0
        echo "[$(date)] Players online. Minutes: $minutes"
    done

    echo "[$(date)] Shutting down..."
    sudo systemctl stop minecraft.service

    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    INSTANCEID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)
    aws ec2 stop-instances --instance-ids $INSTANCEID
}

main