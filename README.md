# ChiaMonitor
This is a Chia monitoring solution for people who need to run multiple harvester on different hosts.
It is based on the [Grafana](https://grafana.com/docs/grafana/latest/installation/) (Data Visualization), [Prometheus](https://prometheus.io/docs/prometheus/latest/installation/) (Data Persistence & Query) and Mtail (binary file included, Data Collector).

## Features
Check the following screenshot. It provides many useful info and you can set your plot size (K32 by default) and Netspace Unit (It is increasing so fast!)
![Screenshot of the dashboard](/screenshot.PNG "Screenshot of the dashboards")

## How to Setup
In short, you need to install Grafana & Prometheus on your full node farmer host and install/copy mtial on all the hosts running harvesters.

### On the full node farmer host
This tutorial will not include how to install Grafana & Prometheus, Google is your friend.
One tip is make sure your 3000 (Grafana) , 9090 (Prometheus) and 3903 (Mtail) ports can be accessed by others.

After you installed Grafana & Prometheus, modify the prometheus.yml in the package. Replace the harvester host ip by yours.
Copy the prometheus.yml to your Prometheus path and run Grafana & Prometheus.

### On the harvestor hosts
Checkout the repo on your hosts and run ./run_mtail.sh. That's it.

Note: if your Chia is not install in the ~/ (home path) you need to modify the run_mtail.sh with your Chia install path.

### Import Dashboard on Grafana
I made both English (grafana_dashboard_en.json) and Chinese (grafana_dashboard_zh.json) version of the dashboard. You can import them on the Grafana.
To open the Grafana, use browser access your farmer host, e.g. 192.168.0.1:3000

After a simple setup you should be able to add data source and import JSON dashboard. It's very straightforward, here are some screenshots.

Datasource steup
![Screenshot of the datasource](/datasource.PNG "Screenshot of the datasource")

Import Dashboard JSON
![Screenshot of the import](/import.PNG "Screenshot of the import")

You are all set! Enjoy and give a star if you like this!

