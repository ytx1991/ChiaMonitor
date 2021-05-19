# ~/.chia/mainnet/log/ is where your Chia logs saved.
# Replace them if they are different on your host
nohup watch -n 30 "../venv/bin/chia farm summary > farmer_summary.log" &
nohup ./mtail --progs ./ --logs ~/.chia/mainnet/log/debug.log --logs ./farmer_summary.log --poll_interval 3000ms &