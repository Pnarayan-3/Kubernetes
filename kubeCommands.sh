# some pod commands
kubectl apply -f pod.yml
kubectl exec -it pod/nginx-pod . -n nginx --bash
kubectl describe pod/nginx-pod -n nginx # it will give every status 
kubectl scale deployment/nginx-deployment -n nginx --replicas=5 # scale the replica to 5 from 2 having the deployment named nginx-deployment
kubectl get-all -n nginx

# to create replicaset and view them
kubectl apply -f replicasets.yml
kubectl get replicasets -n nginx

# some commands related to cronjob 
kubectl apply -f cronjob.yml
kubectl get cronjob -n nginx
kubectl get pods -n nginx
kubectl logs pod -n nginx
kubectl delete -f cronjob.yml

# some commands related with persistent volumes and persistent volume claims
kubectl get pv
kubectl get pvc

# port forwarding
kubectl port-forward service/nginx-service -n nginx 80:80 --address=0.0.0.0

