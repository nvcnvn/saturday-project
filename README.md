Setup:
- Setup GCP sdk
- https://cloud.google.com/docs/authentication/provide-credentials-adc#how-to
- make plan
- https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke 
- Connect to local cluster
- gcloud container clusters get-credentials simple-autopilot-public-cluster --region asia-southeast1 --project $PROJECT_NAME

What todo next:
- Secure backend for tf, for now this is an one-men project, no need to have lock for example