sudo docker save -o glassfish.tar iandockerrepo/glassfish:latest
sudo ctr -n k8s.io images import glassfish.tar

kubectl apply -f glassfish-deployment.yaml
kubectl get pods
kubectl get svc
