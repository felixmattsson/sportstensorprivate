apt update && apt install sudo curl && curl -sL https://raw.githubusercontent.com/Unitech/pm2/master/packager/setup.deb.sh | sudo -E bash -

docker run -it --user root  -p 8092:8092  -v C:/Users/felix/Documents/gitrepos/sportstensor:/app  -w /app  sportstensor /bin/bash

cp neurons/example.miner.env neurons/miner.env

pip install bittensor-cli

btcli wallet regen-coldkey

btcli wallet regen-hotkey

export WANDB_API_KEY=37a6ef63979c0c14b609e885f7b7ab2bdfd255e9

# for testnet
pm2 start -f neurons/miner.py --name sportstensor-miner -- \
    --netuid 172 \
    --subtensor.network test \
    --wallet.name anonymous-walrus \
    --wallet.hotkey anonymous-walrus-hotkey \
    --axon.port 8092 \
    --axon.external_ip 78.72.47.17 \
    --logging.trace \
    --blacklist.validator_min_stake 0


# for mainnet
pm2 start -f neurons/miner.py --name sportstensor-miner -- \
    --netuid 41 \
    --wallet.name anonymous-walrus \
    --wallet.hotkey anonymous-walrus-hotkey \
    --axon.port 8092 \
    --axon.external_ip 78.72.47.17 \
    --logging.trace \
    --blacklist.validator_min_stake 0

# Set LEAGUE_COMMITMENTS environment variable correctly

# har öppnat port 8092 i både dator/windows firewall, och i routern