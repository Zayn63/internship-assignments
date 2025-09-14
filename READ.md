AWS DevOps Engineer – Assignment
📌 Project Overview

This project demonstrates a CI/CD pipeline on AWS using GitHub Actions, Docker, ECS (Fargate), and ECR.
The goal is to showcase the ability to design, automate, and deploy infrastructure and applications with DevOps best practices.

✅ Infrastructure as Code with Terraform

✅ Containerization with Docker

✅ CI/CD automation with GitHub Actions

✅ Monitoring & logging ready (via CloudWatch)

✅ No hardcoded secrets (uses GitHub → AWS OIDC or Secrets Manager)

📌 Architecture Diagram

Workflow:

Developer pushes code to GitHub.

GitHub Actions builds a Docker image and pushes it to Amazon ECR.

ECS (Fargate) pulls the image and runs the container.

Traffic is routed through an Application Load Balancer (ALB).

End users access the app via the ALB DNS.

📌 Tech Stack Justification

AWS ECS (Fargate) → Serverless container orchestration (no EC2 management).

Amazon ECR → Secure, managed Docker image registry.

Application Load Balancer → High availability and traffic distribution.

GitHub Actions → CI/CD pipeline for build → test → deploy → rollback.

Terraform → Reproducible, modular infrastructure as code.

Docker → Ensures consistent application packaging.

📌 Folder Structure
/app         → Node.js sample app + Dockerfile
/iac         → Terraform configs (ECR, ECS cluster, ALB, IAM)
/pipeline    → GitHub Actions workflow (build & deploy)
/ARCHITECTURE.png → Architecture diagram
/README.md   → Documentation

📌 Steps to Deploy
1. Clone the Repository
git clone https://github.com/<zayn63>/aws-devops-assignment.git
cd aws-devops-assignment

2. Provision Infrastructure (Terraform)
cd iac
terraform init
terraform apply


This will create ECR, ECS Cluster, Task Definitions, ALB, and IAM roles.

3. CI/CD Pipeline (GitHub Actions)

On every git push to main:

Docker image is built.

Image is pushed to ECR.

ECS Service is updated with the new image.

4. Access the Application

Once deployed, open the ALB DNS from Terraform output:

http://<alb-dns-name>

📌 Demo Credentials
Email: hire-me@anshumat.org
Password: HireMe@2025!

📌 Security Best Practices

🔒 No AWS keys are hardcoded (use OIDC or GitHub Secrets).

🔒 IAM roles with least-privilege policies.

🔒 Secrets stored in AWS Secrets Manager / SSM Parameter Store.

📌 Bonus Implementations

Auto-scaling ECS service.

Blue/Green or Canary deployments with CodeDeploy.

CloudWatch alarms for CPU/Memory utilization.

📌 Note

Since I do not currently have access to an AWS account, this project is delivered as a code-only submission.
All Terraform and GitHub Actions workflows are ready-to-use and can be applied in any AWS environment with proper IAM permissions.gy