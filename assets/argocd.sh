kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.14.10/manifests/install.yaml
kubectl get svc -n argocd
kubectl edit svc argocd-server -n argocd
# Change the type from ClusterIP to LoadBalancer
# Save and exit the editor
# Wait for the LoadBalancer IP to be assigned

kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d; echo

# argocd repo add https://github.com/chandra217/shopping-app.git

# argocd login --core  

