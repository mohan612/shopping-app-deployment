kubectl create secret docker-registry acr-credentials \
  --docker-server=acdemoacr001.azurecr.io \
  --docker-username=jenkins-access \
  --docker-password=H57mu3U0uFReTLjPkDXfbUYdcaX0ddpa7rkVopOADu+ACRCeUmXn \
  --namespace=argocd
