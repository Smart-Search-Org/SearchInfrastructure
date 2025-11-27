Run manually:

- Namespace
`kubectl create namespace argocd`

- Installation
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`

- Get password:
`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | foreach { [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_)) }`
