bb hellosvr_client && chmod 777 bazel-bin/hellosvr_client && cp bazel-bin/hellosvr_client . 
docker build -t ccr.ccs.tencentyun.com/hmjmf/hellosvr_client -f hellosvr_client.Dockerfile . && docker push ccr.ccs.tencentyun.com/hmjmf/hellosvr_client

kubectl apply -f hellosvr-client-job.yaml 
kubectl get job
kubectl get pod
pods=$(kubectl get pods | grep hellosvrclient | awk '{print $1}')
echo $pods
kubectl log $pods
kubectl delete job hellosvrclient