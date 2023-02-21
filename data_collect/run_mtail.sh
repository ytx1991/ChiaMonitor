# ~/.chia/mainnet/log/ is where your Chia logs saved.
# Replace them if they are different on your host
fingerprint=2637045125
chmod +x merge.sh
nohup watch -n 30 "../venv/bin/chia farm summary > farmer_summary.log" &
nohup watch -n 30 "../venv/bin/chia rpc farmer get_harvesters_summary | python3 -c \"import sys, json; raw=' '.join(sys.stdin); res=json.loads(raw[raw.find('{'):]); [print(h) for h in res['harvesters']]\" > harvester_summary.log" &
nohup watch -n 30 "../venv/bin/chia wallet show -f $fingerprint > wallet.log && grep  ' ' wallet.log | tr '\n' ' ' > one_line_wallet.log && echo -e '\n' >>  one_line_wallet.log" &
nohup watch -n 30 "../venv/bin/chia plotnft show -f $fingerprint > nft.log && awk -v RS=Wallet '{print > ("nft-" NR ".log")}' nft.log " &
nohup watch -n 30 "./merge.sh" &
nohup ./mtail --progs ./ --logs ~/.chia/mainnet/log/debug.log --logs ./"*.log" --poll_interval 1000ms &
