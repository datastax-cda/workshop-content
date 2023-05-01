
## Authenticate GKE Cluster
```shell
gcloud container clusters get-credentials prometheus-testing --zone us-central1-c --project gcp-data-architects-dev
Fetching cluster endpoint and auth data.
kubeconfig entry generated for prometheus-testing.
```
### Add Prometheus Helm Chart
```shell
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```
#### Prometheus Configuration
The only Prometheus configuration parameter that needs to be added in order to receive metrics is below:
```yaml
extraFlags:
    - web.enable-remote-write-receiver
```
This parameter is already set in `prometheus.yaml`
### Install Prometheus
```shell
helm install prometheus -f prometheus.yaml prometheus-community/prometheus
```
```shell
Get the Alertmanager URL by running these commands in the same shell:
  export POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus,component=" -o jsonpath="{.items[0].metadata.name}")
  kubectl --namespace default port-forward $POD_NAME 9093
```
### Install Grafana
```shell
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```
```shell
helm install -f values-grafana.yaml grafana grafana/grafana
```
### Install nginx Controller
```shell
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx
```

#### Note the External IP Address
```shell
kubectl get service nginx-ingress-ingress-nginx-controller

NAME                                     TYPE           CLUSTER-IP    EXTERNAL-IP      PORT(S)                      AGE
nginx-ingress-ingress-nginx-controller   LoadBalancer   10.48.0.137   35.232.246.148   80:32433/TCP,443:32326/TCP   2m28s
```

### Create Basic Auth Secret
#### Make an Auth file
use `htpasswd` to create a username and hashed password file
in this example, `auth` is the name of the password file, and `publisher` is the user name
```shell
htpasswd -c auth publisher
New password:
Re-type new password:
Adding password for user publisher
```
#### Upload to k8s
```shell
kubectl create secret generic basic-auth --from-file=auth
secret/basic-auth created
```
### Update `nginx.yaml` with External IP
be sure to leave the `.nip.io`
```yaml
spec:
  rules:
  - host: "YOUR_EXTERNAL_IP.nip.io"
```
#### Create Ingress route
```shell
kubectl apply -f nginx.yaml
ingress.networking.k8s.io/ingress-resource created
```
### Resources
- [gcloud docs](https://cloud.google.com/community/tutorials/nginx-ingress-gke)
- [k8s nginx docs](https://kubernetes.github.io/ingress-nginx/examples/auth/basic/)
- [nginx rewrite](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#rewrite)
- [nginx rewrite detail](https://kubernetes.github.io/ingress-nginx/examples/rewrite/)