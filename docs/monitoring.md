**MONITORING STACK**
w/ monitoring, you find when something is down. its shows real time data and gives visibility to your entire application.

**Node Exporter**
it reads the linux kernel interfaces '/proc', '/sys' and exposes them as metrics on port 9100. It runs directly on the host machine, because these config files are not accessible inside the k3s cluster. 

**PROMETHEUS**
prometheus, scrapes metrics from target every 15 seconds, and stores them as time series data.

your targets are:
	1. localhost:9090 - prometheus itself
	2. localhost:9100 - Node Exporter (Linux Metrics)
	3. localhost:9187 - postgres_exporter (db metrics)

**GRAFANA**
-grafana now connects to prometheus as data source and visualizes the stored metrics.
-dashboard 1860 is community node exporter - CPU, RAM, disk etc.
-dashboard 9628 is community PostgreSQL dashboard - active sessions, transactions, usage per database.

**OBSERVATIONS**
-CPU usage
-RAM usage
-Disk space remaining
-Network traffic
-PostgreSQL version, active connections, transactions per database

