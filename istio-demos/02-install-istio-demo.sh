cd $ISTIO_HOME
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled
kubectl apply -f ${ISTIO_HOME}/samples/bookinfo/platform/kube/bookinfo.yaml

while [[ $(kubectl get pods -l app=ratings -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]
do
	echo "waiting for ratings pod"
	kubectl get pods
	sleep 60
done

kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"

