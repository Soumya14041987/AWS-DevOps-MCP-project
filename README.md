# EKS Cluster with Monitoring Stack

This repository contains Terraform configurations to deploy an Amazon EKS cluster with the following components:

- AWS VPC CNI add-on
- Prometheus monitoring
- Grafana dashboards

## Module Structure

```
terraform/
├── modules/
│   └── eks/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── versions.tf
└── environments/
    └── dev/
        ├── main.tf
        └── versions.tf
```

## Prerequisites

- AWS CLI configured
- Terraform >= 1.0
- kubectl installed
- helm installed

## Usage

1. Update the VPC and subnet IDs in `terraform/environments/dev/main.tf`
2. Configure your S3 backend in `terraform/environments/dev/versions.tf`
3. Initialize and apply Terraform:

```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

## Accessing Grafana

1. Get the Grafana admin password:
```bash
kubectl get secret -n monitoring prometheus-grafana -o jsonpath='{.data.admin-password}' | base64 -d
```

2. Port forward Grafana service:
```bash
kubectl port-forward -n monitoring svc/prometheus-grafana 8080:80
```

3. Access Grafana at: http://localhost:8080
   - Username: admin
   - Password: [from step 1]

## Monitoring

The deployment includes:
- Prometheus for metrics collection
- Grafana for visualization
- Pre-configured dashboards for Kubernetes monitoring

## Clean Up

To destroy the infrastructure:
```bash
terraform destroy
```