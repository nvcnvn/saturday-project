# About this Project:
```sh
.
├── helm # helm chart folder, for now only a demo nginx
├── Makefile # helpful short cut
├── .github/workflow # Github Action automation script
└── tf # terraform code for setup infrastructure

```
Feature:
- Use terraform to create GKE Auto Pilot cluster
- Use Github Action to automate application update when merge (manual trigger also support)
- Use helm to managed application (currently an demo nginx)

# Setup:
This project require to manual setup GKE cluster using terraform first, following the following steps.  

## GCP
- make sure you have tool like: make, kubectl, helm, gcloud, terraform installed
- Setup GCP sdk
- https://cloud.google.com/docs/authentication/provide-credentials-adc#how-to
- run: `make plan`, if you have all the tools installed, we suppose to see a "green" status from terraform
- run: `make apply` (and have a cup of coffee or tea, this is optional)
- https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke 
- Connect to local cluster and verify
- gcloud container clusters get-credentials simple-autopilot-public-cluster --region asia-southeast1 --project $PROJECT_NAME
## Github Action
- If you keeping everything by default, the Github Action automation script will work as expected
- If not (like changing cluster name), go here and edit the cluster name https://github.com/nvcnvn/saturday-project/blob/9e2d1be63ff9e4e45ceca4900abe6f1d37fdb835/.github/workflows/deploy-nginx.yaml#L36
- Example of jobs run and the logs: https://github.com/nvcnvn/saturday-project/actions/workflows/deploy-nginx.yaml
- Check this example on how to manually trigger the job: https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#providing-inputs
- Or you can just modify the helm chart values and merge for the job to run

What todo next:
- Secure backend for tf, for now this is an one-men project, no need to have lock
- An Github Action workflow to run tf after I already set up a proper backend
- Use keyless authentication to make Github Action <> GCP more secure (currently I use a SA key)
- Grant Github Action only permission to deploy via k8s RBAC
- Use tf to create alerts rule for deployment failure
- A local development env using Github Code Space so you don't need to install the required tools (make, kubectl,...)