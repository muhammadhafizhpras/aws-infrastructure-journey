# AWS Journey — From IT Support to Cloud Engineer

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=flat&logo=amazon-aws&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)

## About This Repo
Repo ini adalah dokumentasi perjalanan saya belajar AWS secara terstruktur menggunakan
Terraform, sambil bekerja sebagai IT Support. Setiap folder di `topics/` adalah satu
service/konsep AWS yang saya pelajari dengan cara langsung praktik (learning by doing),
bukan sekadar baca dokumentasi.

**Kenapa repo ini publik:** Saya percaya proses belajar itu sendiri punya nilai untuk
ditunjukkan — bukan cuma hasil akhir. Repo ini menunjukkan bagaimana saya mendekati
masalah baru, riset, dan iterasi.

## Certifications
- ✅ AWS Certified Cloud Practitioner
- ✅ AWS Certified Solutions Architect – Associate
- 🔄 Microsoft Certified: Azure Administrator Associate (AZ-104) — in progress

## Roadmap & Progress

| # | Topic | Status | AWS Services | Notes |
|---|---|---|---|---|
| 00 | [Terraform Fundamentals](./topics/00-terraform-fundamentals) | ✅ Done | - | State, variables, modules |
| 01 | [IAM Foundations](./topics/01-iam-foundations) | ✅ Done | IAM | Least privilege practice |
| 02 | [Networking VPC](./topics/02-networking-vpc) | 🔄 In Progress | VPC, NAT, Subnet | |
| 03 | [Compute EC2](./topics/03-compute-ec2) | ⬜ Not Started | EC2, EBS | |
| ... | ... | ... | ... | |

## Reusable Terraform Modules
Semua module di `/modules` ditulis reusable dan dipakai berkali-kali di berbagai topic —
lihat [module catalog](./modules/README.md) untuk daftar lengkap dan cara pakai.

## Capstone Project
Proyek akhir yang menggabungkan seluruh topic jadi satu arsitektur 3-tier web app —
[lihat detail di sini](./capstone-project/).

## Tech Stack
Terraform · AWS · GitHub Actions (planned) · tflint · pre-commit

## Connect
[LinkedIn] · [Blog/Medium jika ada]