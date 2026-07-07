**URL SHORTENER**

for the url shortener, I specifically used the Shlink, it is an API. 
the reason we chose shlink was:
	1. official docker image
	2. postgresql integration
	3. configuration via environment variables

	4. its was not about url shortening, its was making things work in my infrastructure.
	5. real app works inside k3s pod, connects to postgresql.


**K3s**

-the image of shlink was deployed through docker to kubernetes pod
-storing credentials in Secrets keeps them out of YAML files and out of Git. if stored in k8s secrets, it prevents unauthorized access, and keeps sensitive data out of vcs like github


**connection with postgresql**

-the pod inside k3s has its own network namespace, it is not possible for it to access items in localhost where PostgreSQL is, the local host for the pod is the k3s cluster itself.
-so we added a rule in pg_hba.confg file that allowing access from '10.42.0.1' ip address (host gateway IP) can access postgres.


**NodePort Service**
-after deployment got my pod running, it was reachable only inside my cluster. I created a nodeport service, that maps port 30081 on the localhost to port 8080 inside the pod. 
-so, anyone connected to the same network can now access the apps I've exposed.
-we used labels and selectors inside my yaml files to ensure the service finds correct pod by label and not by ip as it changes frequently.



