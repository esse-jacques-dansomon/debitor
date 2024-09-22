# Deploy Application with Postgres

```shell
alias k="kubectl --namespace webapps"
alias k="kubectl"

k create -f ns.yaml
k create -f postgres-configmap.yaml -n webapps
k create -f postgres-credentials.yaml -n webapps
k create -f psql-pv.yaml -n webapps
k create -f psql-claim.yaml -n webapps
k create -f psql-deployment.yaml -n webapps
k create -f psql-service.yaml -n webapps


k delete -f postgres-configmap.yaml -n webapps
k delete -f postgres-credentials.yaml -n webapps
k delete -f psql-pv.yaml -n webapps
k delete -f psql-claim.yaml -n webapps
k delete -f psql-deployment.yaml -n webapps
k delete -f psql-service.yaml -n webapps

k apply -f app-deployment.yaml -n webapps
k get all -n webapps
k delete -f app-deployment.yaml -n webapps



k describe pod shopapi-deploy-69884f7888-qk55q  -n webapps
k logs shopapi-deploy-69884f7888-qk55q  -n webapps
k get deployments, pods -n webapps

k exec -it postgres-6d7cb4f9f4-j7lgp -- psql -h localhost -U cG9zdGdyZXM= --password -p 5432 school_management


```