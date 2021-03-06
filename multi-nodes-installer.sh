#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/ShadXo/aph-multi-mn-installation/master/mcarper.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='apholding/APH-Wallets'
# Display Name.
DAEMON_NAME='APHolding Core'
# Coin Ticker.
TICKER='APH'
# Binary base name.
BIN_BASE='apholding'
# Directory.
DIRECTORY='.apholding'
# Conf File.
CONF='apholding.conf'
# Port.
DEFAULT_PORT=5662
# Explorer URL.
EXPLORER_URL='http://explorer.apholding.org/'
# Rate limit explorer.
EXPLORER_SLEEP=1
EXPLORER_PEERS='api/peer'
EXPLORER_BLOCKCOUNT_OFFSET='+8'
# Amount of Collateral needed.
COLLATERAL=75000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1
IPV6=0
MASTERNODE_CALLER='getmasternode'
MASTERNODE_NAME='masternode'
MASTERNODE_GENKEY_COMMAND='createmasternodekey'
MASTERNODE_LIST='listmasternodes'


# Tip Address.
TIPS='DTu1fh3F6ujvEoZsqMtFZ31VFJzfkBeUpf'
# Dropbox Addnodes.
#DROPBOX_ADDNODES='s0pdil1rehsy4fu'
#USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
#DROPBOX_BOOTSTRAP='7rawf808f0hv9jg'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='latest'
#DROPBOX_BLOCKS_N_CHAINS='s4vy92sczk9c10s'
ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "APHOLDING"

APHOLDING
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- raw.githubusercontent.com/ShadXo/aph-multi-mn-installation/master/mcarper.sh -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null
