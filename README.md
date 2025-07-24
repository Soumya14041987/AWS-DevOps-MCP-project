# AWS DevOps MCP Project

This repository contains both DevOps tools installation scripts and Terraform configurations for AWS infrastructure deployment.

## Contents

1. [DevOps Tools Installation](#devops-tools-installation)
2. [EKS Cluster with Monitoring Stack](#eks-cluster-with-monitoring-stack)

---

## DevOps Tools Installation

This repository contains a shell script for automatically installing essential DevOps tools on Ubuntu/Debian-based systems. The script installs and configures the following tools:

- Git (Version Control)
- AWS CLI v2 (AWS Command Line Interface)
- Terraform (Infrastructure as Code)
- kubectl (Kubernetes Command Line Tool)
- Minikube (Local Kubernetes Cluster)
- Helm (Kubernetes Package Manager)

### Prerequisites

- Ubuntu/Debian-based Linux distribution
- Sudo privileges
- Internet connection
- At least 4GB of free disk space
- At least 4GB of RAM (recommended for Minikube)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Soumya14041987/AWS-DevOps-MCP-project.git
   cd AWS-DevOps-MCP-project
   ```

2. Make the script executable:
   ```bash
   chmod +x tools-install.sh
   ```

3. Run the installation script:
   ```bash
   ./tools-install.sh
   ```

### What the Script Does

The installation script performs the following actions:

1. Updates system packages
2. Installs necessary dependencies
3. Installs and configures each tool:
   - Git for version control
   - AWS CLI v2 for AWS resource management
   - Terraform for infrastructure as code
   - kubectl for Kubernetes cluster management
   - Minikube for local Kubernetes development
   - Helm for Kubernetes package management
4. Verifies the installation of each tool

### Post-Installation Setup

#### AWS CLI Configuration
```bash
aws configure
```
Enter your AWS credentials when prompted.

#### Minikube Start
```bash
minikube start
```

#### Verify Kubernetes Connection
```bash
kubectl cluster-info
```

### Tool Versions

The script installs the latest stable versions of all tools. To check versions:

```bash
git --version
aws --version
terraform --version
kubectl version --client
minikube version
helm version
```

### Troubleshooting

Common issues and solutions:

1. If you get permission errors:
   - Ensure you have sudo privileges
   - Run `chmod +x tools-install.sh`

2. If Minikube fails to start:
   - Ensure virtualization is enabled in BIOS
   - Check system resources (RAM, CPU)
   - Run `minikube delete` and try again

3. If AWS CLI configuration fails:
   - Verify your AWS credentials
   - Check your internet connection

### Uninstallation

To remove the installed tools:

```bash
sudo apt-get remove git terraform helm
sudo rm -rf /usr/local/bin/kubectl /usr/local/bin/minikube
sudo rm -rf /usr/local/aws-cli
```

---

## EKS Cluster with Monitoring Stack

This repository also contains Terraform configurations to deploy an Amazon EKS cluster with the following components:

- AWS VPC CNI add-on
- Prometheus monitoring
- Grafana dashboards

### Module Structure

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

### Prerequisites

- AWS CLI configured
- Terraform >= 1.0
- kubectl installed
- helm installed

### Usage

1. Update the VPC and subnet IDs in `terraform/environments/dev/main.tf`
2. Configure your S3 backend in `terraform/environments/dev/versions.tf`
3. Initialize and apply Terraform:

```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

### Accessing Grafana

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

### Monitoring

The deployment includes:
- Prometheus for metrics collection
- Grafana for visualization
- Pre-configured dashboards for Kubernetes monitoring

### Clean Up

To destroy the infrastructure:
```bash
terraform destroy
```

---

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [kubectl Documentation](https://kubernetes.io/docs/reference/kubectl/)
- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)

## Support

For issues and questions:
- Check the tool's official documentation
- Review the troubleshooting section
- Submit an issue in the repository

## License

This project is provided under the MIT License. Feel free to modify and distribute it as needed.
