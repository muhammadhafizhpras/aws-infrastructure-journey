aws-infrastructure-journey/
├── README.md
├── LICENSE
├── .gitignore
├── .pre-commit-config.yaml
├── .tflint.hcl
├── Makefile
├── docs/
│   ├── naming-convention.md
│   ├── tagging-strategy.md
│   └── module-catalog.md          # daftar semua module yang tersedia + cara pakai
├── modules/                        # <<< SEMUA REUSABLE MODULE ADA DI SINI
│   ├── vpc/
│   ├── security-group/
│   ├── ec2-instance/
│   ├── iam-role/
│   ├── s3-bucket/
│   ├── rds-instance/
│   ├── alb/
│   ├── autoscaling-group/
│   ├── lambda-function/
│   ├── ecs-fargate-service/
│   ├── sns-topic/
│   ├── sqs-queue/
│   ├── cloudwatch-alarm/
│   └── route53-record/
└── topics/       
    ├── 00-terraform-fundamentals/
    ├── 01-iam-foundations/
    ├── 02-networking-vpc/
    ├── 03-compute-ec2/
    ├── 04-storage-s3/
    ├── 05-database-rds/
    ├── 06-load-balancing-autoscaling/
    ├── 07-serverless-lambda/
    ├── 08-containers-ecs-eks/
    ├── 09-dns-cdn-route53-cloudfront/
    ├── 10-messaging-sns-sqs/
    ├── 11-monitoring-cloudwatch/
    ├── 12-security-kms-secrets-manager/
    ├── 13-terraform-state-management/
    ├── 14-cost-optimization/
    └── capstone-project/