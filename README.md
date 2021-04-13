# A sample flask app to be deployed in kubernetes


This is a demo project to deploy a containerized flask application to k8.


Clone the repo, build the docker image, load it into minikube, apply the deployment, start the service and monitor it using commands:

```bash
minikube start
docker build -t k8f .
minikube image load k8f
kubectl apply -f deployment.yaml
minikube service newk8f
minikube dashboard
```