# ChiaMonitor
This is a Chia monitoring solution for people who need to run multiple harvesters on different hosts.
It is based on [Grafana](https://grafana.com/docs/grafana/latest/installation/) (Data Visualization), [Prometheus](https://prometheus.io/docs/prometheus/latest/installation/) (Data Persistence & Query), and [Mtail](https://github.com/google/mtail/releases) (Data Collector).

All these components support most popular OS such as Linux/Windows/MacOS.

## Features
Check the following screenshot. It provides many useful numbers, and you can set your plot size (`K32` by default) and Netspace Unit (It is increasing so fast!)
![Screenshot of the dashboard](/screenshot.PNG "Screenshot of the dashboard")

## How to Setup
First, checkout this repo from the Github.
In short, you need to install Grafana & Prometheus on your full node farmer host and install/copy mtail on all the hosts running harvesters.
![Overall](/overall.png "High level architecture")

### Install Mtail on all the harvesters hosts (include main host if you run harvester on it)
1. Add Mtail default port 3903 to your inbound firewall rule

2. Go to https://github.com/google/mtail/releases download and unzip latest version (not earlier than 3.0.0 rc45)

3. Copy the mtail (.exe) binary file to the `data_collect` folder in the repo folder you checked out

4. Copy the the `data_collect` folder to your Chia install folder. This is because of the script is using relative path.
For Linux, it should be /your/path/to/chia-blockchain
For Windows, the default path looks like: C:\Users\YOUR_USER_NAME\AppData\Local\chia-blockchain\app-1.1.5

5. Run `./run_mtail.sh` (Linux) / `./run_mtail.bat`  IN the data_collect folder (Windows needs to keep the two pop-up windows open).

6. Open http://localhost:3903 you should see a primitive mtail website.

Note: Mtail needs some time to read through your log. If you want to speed up, try to delete the current debug.log.

### Install Prometheus on the main host
1. Add Prometheus default port 9090 to your inbound firewall rule

2. Go to https://prometheus.io/download/ download right version based on your OS.

3. Unzip the file and open the folder

4. Copy and override the `prometheus.yml` by the one provided by this repo.

5. Replace the harvester host ip by yours.

6. Run Prometheus. (You need to run this at the backend in the Linux)

7. Check the http://localhost:9090. You should see the Prometheus portal.


### Install Grafana on the main host

1. Add Grafana default port 3000 to your inbound firewall rule

2. Go to https://grafana.com/docs/grafana/latest/installation/ install right version based on your OS.

3. Follow the instruction on the Grafana website to run the service.

4. Use web browser open http://localhost:3000, you will see the Grafana portal

5. Create a new password for the admin

6. Create a new data source named as Chia, check the screenshot.
![Screenshot of the datasource](/datasource.PNG "Screenshot of the datasource")

7. Import the dashboard json based on the language you like.
![Screenshot of the import](/import.PNG "Screenshot of the import")


You are all set! Enjoy and give a star if you like this!
Donate xch1adq8a7r5e2qkeyxgw0pml735efnsqaqk4uyyj926e4h0zg28faqsufq0k4
