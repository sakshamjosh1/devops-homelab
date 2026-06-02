self hosted production homelab

Goals:
    -goal is to demonstrate the use of k8s in production environment, showcasing the use of real world applications like postgresql, prometheus, grafana, alertmanager.
    -run my own portfolio website using this homelabn
    -learn linux and k8s deeply

Architecture:
    -Linux Mint is the host machine
    -inside it we will run k3s
    -k3s will run my 2 apps, portfolio website and url shortner
    -host machine will also include the postgresql database, monitoring tools like prometheus and grafana and alertmanager for alerting

Key Technologies:
    -Linux
    -Docker
    -Kubernetes
    -postgresql
    -git github
    -prometheus
    -grafana
    -alertmanager

Success criteria:
    -i can successfully implement this entire project
    -break stuff and rebuild them
    -use and learn major k8s concepts and services
    -websites can be run and hosted successfully

NFRs:

- Services should automatically recover from failures
- Application metrics should be observable
- Critical failures should generate alerts
- Data should survive Kubernetes failure
- Infrastructure should be reproducible from Git
