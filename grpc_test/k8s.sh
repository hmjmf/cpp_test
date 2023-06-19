kubectl create secret docker-registry tcr --docker-server=ccr.ccs.tencentyun.com   --docker-username=12345   --docker-password=12345   --docker-email=12345@qq.com
kubectl apply -f k8s.yaml 
kubectl replace --force -f k8s.yaml 
kubectl get pods
