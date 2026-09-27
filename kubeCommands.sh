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
kubectl delete -f .  # this command will delete all the resources.

# some commands related with persistent volumes and persistent volume claims
kubectl get pv
kubectl get pvc

# port forwarding and scaling
kubectl port-forward service/nginx-service -n nginx 80:80 --address=0.0.0.0
kubectl scale deployment apache-deployment -n apache --replicas=3

# some commands related to statefulsets
kubectl exec -it mysql-statefulset -o -n mysql --bash

# some commands related to taints and toleration
kubectl taint nodes <node> key=value:effect  # example- kubectl taint nodes node1 environment=production:NoSchedule
kubectl taint nodes node1 environment=production:NoSchedule-   # command to removing a taint (-) means removing.

# toleration example
spec:
  tolerations:
    - key: "gpu"
      operator: "Equal"
      value: "true"
      effect: "NoSchedule"

# some commands related to hpa,keda
kubectl top node # it will show metrics
kubectl run -it load-generator --image=busybox -n apache --bash
kubectl run -i --tty load-generator --image=busybox -n apache ./bin/sh

# some commands related to vpa
kubectl get hpa -n apache
kubectl run -i --tty load-generator --image=busybox -n apache /bin/sh

# some commands related to rbac
kubectl auth whoami  # tells you which Kubernetes identity you are currently authenticated as.
kubectl auth can-i get pods # this commands tells Does my current identity have permission to perform get on Pods?
kubectl auth can-i get deployment -n apache
kubectl auth can-i get delete deployment -n apache
kubectl auth can-i get pods --as=apache-user -n apache
kubectl auth can-i get deployments --as=apache-user -n apache

# some commands related to kubernetes dashboard -monitoring
kubectl -n kubernetes-dashboard create token admin-user # Create an authentication token for the Kubernetes ServiceAccount named admin-user in the kubernetes-dashboard namespace.
kubectl proxy --address=0.0.0.0 # This starts a local proxy server that forwards requests to the Kubernetes API server.
kubectl proxy --port=8001 --address=0.0.0.0 --accept-hosts='*' # This is useful in some remote-access/lab setups where you're accessing the proxy through a hostname or IP other than localhost.
