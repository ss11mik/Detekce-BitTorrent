#!/usr/bin/env sh
#
# project: Bittorrent Traffic Detection
# author: xmikul69
# course: PDS @ FIT VUT
# 2023

tshark -r $1 -T fields -E separator=";" -2 -o tcp.reassemble_out_of_order:TRUE -d udp.port==47222,bt-dht \
    -e frame.number -e frame.time_relative -e ip.src -e ip.dst -e udp.srcport -e udp.dstport \
    -e bt-dht.ip -e bt-dht.port -e bt-dht.bencoded.string \
    -e bittorrent.piece.index -e bittorrent.msg.type -e bittorrent.info_hash -e bittorrent.msg.length \
    -e data.data \
    -e dns.a \
    "bt-dht or bittorrent or dns or (data.data contains 2f616e6e6f756e6365) or (data.data contains 2f736372617065) or (data.data contains \"/announce\") or (data.data contains \"/scrape\")" > $1.csv

    # 2f616e6e6f756e6365 is encoded "/announce"
    # 2f736372617065 is encoded "/scrape"
