# 🚀 AWS Infrastructure Project - Chapter 01: IAM Foundations

![AWS](https://img.shields.io/badge/AWS-IAM-orange?logo=amazon-aws)
![Terraform](https://img.shields.io/badge/IaC-Terraform_v1.5+-purple?logo=terraform)
![Security](https://img.shields.io/badge/Security-CIS_Benchmark-green)

This directory contains the implementation of **IAM Foundations**, representing the first chapter of the *AWS Infrastructure Project* portfolio. The entire infrastructure is managed using an **Infrastructure as Code (IaC)** approach with **Terraform**, following **Least Privilege** principles and **AWS CIS Benchmark** security standards.

---

## 📌 Project Objectives

1. **Root Lockdown & Hardening:** Secure the Root account with Multi-Factor Authentication (MFA) and prevent its usage for day-to-day operations.
2. **Strict Password Policy:** Enforce enterprise-grade account password strength and rotation policies.
3. **Group-Based Access Control:** Manage permissions through IAM Groups instead of attaching policies directly to individual users.
4. **Daily Operational Admin Account:** Provision an IAM Admin User for daily tasks bound to the Administrators group.
5. **Role-Based Service Identity:** Provision an IAM Role for EC2 instances to access Amazon S3 resources securely without hardcoded access keys.

---

## 📁 Repository Structure

```text
01-iam-foundations/
├── providers.tf      # Terraform Version and Region
├── main.tf           # Core AWS IAM resource declarations
├── variables.tf      # Variable declarations, descriptions, and data types
├── terraform.tfvars  # Actual environment input values
├── outputs.tf        # Exported resource ARNs and IDs
└── README.md         # Official chapter documentation
