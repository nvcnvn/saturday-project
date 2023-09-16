plan:
	cd tf && terraform plan -var-file=terraform.tfvars
apply:
	cd tf && terraform apply -var-file=terraform.tfvars