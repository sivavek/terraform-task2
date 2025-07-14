# terraform-task2

A modular Terraform project to provision and orchestrate the following AWS infrastructure components:

- **Amazon RDS** – MySQL database
- **Amazon EC2** – Compute instance
- **Amazon S3** – Versioned, private storage bucket
- **Application Load Balancer (ALB)** – Public-facing load balancer for routing
- **Default AWS networking** – Uses default VPC, subnets, and security groups

---

## 📦 Module Overview

| Module | Purpose |
|--------|---------|
| `rds`  | Provisions a MySQL RDS instance with defined storage and credentials |
| `ec2`  | Launches an EC2 instance and depends on RDS module completion |
| `s3`   | Creates a versioned S3 bucket with public access disabled |
| `alb`  | Deploys an ALB using default security group and public subnets |

---

## 🌍 Provider

```hcl
provider "aws" {
  region = "us-east-1"
}
This project uses the default VPC, subnets, and security group in the selected region.
```

🚀 Usage
1. Clone this repository

```
git clone https://github.com/sivavek/terraform-task2.git
cd terraform-task2

```

2. Initialize Terraform

```
terraform init

```

3. Validate & Apply

```
terraform validate
terraform plan
terraform apply

```

>[!Note] Terraform will prompt for confirmation before provisioning resources.

# 🔐 Modules and Parameters

Below are the key input parameters for each module. Update the respective module source files if needed.

## RDS Module (./modules/rds)

db_identifier: RDS instance name

instance_class: e.g., db.t3.micro

allocated_storage: in GB

engine: e.g., mysql

username / password: DB login credentials

## EC2 Module (./modules/ec2)

ami_id: Amazon Machine Image ID

instance_type: e.g., t2.micro

subnet_id: ID of the public subnet

name: EC2 instance name tag

## S3 Module (./modules/s3)

bucket_name: Unique S3 bucket name

versioning: true to enable versioning

public_access: false to block public access

## ALB Module (./modules/alb)

name: ALB name

internal: false for internet-facing

subnet_ids: List of public subnet IDs

security_group_ids: SG for ALB traffic rules

## 📝 Notes

Make sure your AWS CLI or environment is configured with appropriate credentials.

AMI ID should be valid for the region (us-east-1). Replace placeholder if necessary.

admin12345 is a sample DB password; consider using secrets management in production.


📁 Project Structure
```
terraform-task2/
├── main.tf
└── modules/
    ├── alb/
    ├── ec2/
    ├── rds/
    └── s3/
```

# 📜 License
MIT License — see LICENSE for details.

# 👤 Author
Vivek Sivakumar

