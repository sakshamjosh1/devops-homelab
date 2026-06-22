**K3s over Minikube**
minikube is basically used for experimentation in local development environments. it is a single node architecture and used for developer testing. k3s however is a full k8s distribution built for production grade environments, and for small scale clusters.

k3s is basically more efficient than minikube for production environment.

**Kubernetes object hierarchy**
1. containers package the entire application's libraries, dependencies, everything in one package.
2. pods runs containers, however they are ephemeral in nature, meaning they can die and revive at any time (but needs manual intervention).
3. deployments runs pods efficiently as they have replica sets which ensure that a certain amount of pods are running thoroughout. even if the pod dies, they will be re-run by replica sets.
4. for production grade environments, it is extremely important for us to deploy deployments as services because of the following reasons.
    a. pods have a specific ip address.
    b. each time a pod dies, the ip associated with it also vanishes.
    c. when a new pod is created, a new ip gets associated with it.
    d. but the users are accessing the previous ip address (as it may change at any time)
    e. this way users are not able to access the application.
    f. labels are associated with pods rather than ip addresses.
    g. this way, the pod is accessed using the label name which is constant throughout.

    **Types of Services**
    
    a. ClusterIP (default): this makes the app only accessible inside the cluster only.
    b. NodePort: this makes the app accessible only inside a certain network or organization
    c. LoadBalancer: this makes the application accessible to everyone in the web.

    **for this project, initially, we are using the nodeport service. this way all the devices connected to the same network as the host machine will only be able to access the application.**

    after this when we will migrate the entire app to cloud (aws) then we will use the LoadBalancer, this way everyone will be able to access the application.

**Labels and Selectors**
in the deployment.yaml file, we added the label, app:portfolio
and in the service.yaml file, we used selector, app:portfolio
the service is saying that find all the pods that have label as app: portfolio and send the traffic to them


**ImagePullPolicy:Never**
this was in the specification file of deployment.yaml, this means that you do not have to pull the image from the image registry as we already have that in the local machine.

Anyways the image was not in the registry, it was in the local machine, thats why it was never needed. we built it locally and imported it directly to k3s

**The deployment**
we deployed the entire app through k8s NodePort service
this demonstrates that all the people within my network or org. will only be able to access this application.

**Real world use-case

many companies which have application which are only to be used internally or within the org, they use nodeport service. this way, anyone outside their network will not be able to access it.
for loadbalancer, which we will implement afterwards, companies use that to expose their product externally to the world.
