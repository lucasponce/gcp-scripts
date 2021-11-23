cd $ISTIO_HOME
kubectl apply -f ${ISTIO_HOME}/samples/bookinfo/networking/bookinfo-gateway.yaml

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "Update your local DNS with the public Ingress IP"
echo "sudo vi /etc/hosts"
echo "${INGRESS_HOST} bookinfo.kiali-recipe.org"
echo "${INGRESS_HOST} kiali.kiali-recipe.org"
echo "${INGRESS_HOST} grafana.kiali-recipe.org"
echo "${INGRESS_HOST} tracing.kiali-recipe.org"
echo "${INGRESS_HOST} control.travel-control.kiali-recipe.org"

echo "Open http://bookinfo.kiali-recipe.org/productpage"