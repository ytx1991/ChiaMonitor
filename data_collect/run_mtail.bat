START farmer_summary.bat
START mtail --progs .\ --logs ..\..\..\..\..\.chia\mainnet\log\debug.log --logs wallet.log --logs farmer_summary.log --logs pool.log --poll_interval 1000ms
