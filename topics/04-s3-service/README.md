# AWS S3 (Simple Storage Service)

Amazon S3 is an object storage service that offers industry-leading scalability, data availability, security, and performance.

---

## 1. S3 Standard

**Description:** Default, general-purpose storage for frequently accessed data (hot data) with very low latency and high throughput.

**How it works:** Stores and replicates objects simultaneously across a minimum of 3 Availability Zones (AZs) upon upload.

**Use cases:** Static websites, mobile applications, content distribution, active big data analytics, and high-traffic API backends.

**Access time:** Milliseconds.

**Cost:** Highest per-GB storage cost compared to other classes, but request costs (API calls like GET/PUT) are very low. No retrieval fees.

**Advantages:** Lowest latency, best performance for access-intensive workloads, no operational restrictions or penalties.

**Disadvantages:** Very expensive if used for infrequently accessed or historical backup data.

| Attribute | Value |
|-----------|-------|
| Availability | Minimum 3 AZs (99.99% SLA) |
| Durability | 99.999999999% (11 nines) |
| Minimum Retention | None |
| Minimum Size | None |

---

## 2. S3 Intelligent-Tiering

**Description:** Automatically optimizes storage costs without compromising performance. Ideal for data with unknown or changing access patterns.

**How it works:** S3 continuously monitors object access patterns. If an object is not accessed for 30 days, it is automatically moved from the Frequent Access tier to the Infrequent Access tier. If the Archive Access option is enabled, objects not accessed for 90 days are moved to the Archive tier. There are no retrieval or transfer fees.

**Use cases:** Data lakes, data analytics, user-generated content, or new application data with unpredictable access history.

**Access time:** Milliseconds for Frequent, Infrequent, and Instant Archive tiers. Hours for Archive and Deep Archive tiers.

**Cost:** Combination of storage cost (based on the current tier) + monthly monitoring fee per 1,000 objects. No retrieval fees.

**Advantages:** Automatic cost savings without complex Lifecycle Rules. No surprise charges if cold data is suddenly accessed.

**Disadvantages:** Additional monitoring fees. Not cost-effective for millions of very small files (under 128 KB).

| Attribute | Value |
|-----------|-------|
| Availability | 2-3 AZs |
| Durability | 99.999999999% (11 nines) |
| Minimum Retention | None (no early deletion fees) |
| Minimum Size | None (objects under 128 KB stay in Frequent Access tier and are not monitored) |

---

## 3. S3 Standard-Infrequent Access (Standard-IA)

**Description:** Storage class for data that is accessed less frequently (warm data) but requires rapid access when needed, just like S3 Standard.

**How it works:** Stores data with cross-3-AZ durability at a lower per-GB price, but charges a retrieval fee when data is read.

**Use cases:** Backup files, disaster recovery, and report files accessed once a month.

**Access time:** Milliseconds.

**Cost:** ~40% cheaper than S3 Standard for storage. Retrieval fees apply per GB each time data is downloaded.

**Advantages:** Same speed performance as S3 Standard at a lower storage cost.

**Disadvantages:** If predictions are wrong and data is frequently downloaded, monthly bills can spike due to retrieval fees.

| Attribute | Value |
|-----------|-------|
| Availability | Minimum 3 AZs (99.9% SLA) |
| Durability | 99.999999999% (11 nines) |
| Minimum Retention | 30 days (full charge applies if deleted earlier) |
| Minimum Size | 128 KB (objects smaller than 128 KB are billed as 128 KB) |

---

## 4. S3 Express One Zone

**Description:** Highest-performance storage class in S3, designed for processing application data with single-digit millisecond latency.

**How it works:** Uses Directory Bucket architecture and stores data in only 1 Availability Zone (AZ) chosen by the user, positioned close to compute resources (EC2 or EKS) to maximize transfer speed.

**Use cases:** Machine Learning / AI training, High-Performance Computing (HPC), real-time media processing, and interactive analytics.

**Access time:** 1 to 5 milliseconds (fastest among all S3 classes).

**Cost:** Slightly higher storage cost, but API request fees are up to 50% cheaper than S3 Standard.

**Advantages:** Extreme performance with very stable latency, supporting hundreds of thousands of transactions per second (TPS).

**Disadvantages:** Vulnerable to data loss if the physical AZ experiences a disaster, as there is no replication to other AZs.

| Attribute | Value |
|-----------|-------|
| Availability | 1 AZ (99.95% SLA) |
| Durability | 99.999999999% (11 nines) within that single AZ |
| Minimum Retention | None |
| Minimum Size | 512 KB (objects under 512 KB are billed as 512 KB) |

---

## 5. S3 One Zone-Infrequent Access (One Zone-IA)

**Description:** A cheaper version of Standard-IA, intended for infrequently accessed data that is non-critical or can be recreated if lost.

**How it works:** Data is stored in only 1 AZ, reducing AWS infrastructure costs and passing savings to the user.

**Use cases:** Secondary backup copies (while primary backup is on-premise), image thumbnails that can be regenerated from originals.

**Access time:** Milliseconds.

**Cost:** ~20% cheaper than Standard-IA. Retrieval fees per GB still apply.

**Advantages:** Most affordable millisecond-access option in the S3 ecosystem.

**Disadvantages:** Risk of permanent data loss if the AZ is physically destroyed (e.g., earthquake, data center fire).

| Attribute | Value |
|-----------|-------|
| Availability | 1 AZ (99.5% SLA) |
| Durability | 99.999999999% (11 nines), but vulnerable at the AZ level |
| Minimum Retention | 30 days |
| Minimum Size | 128 KB |

---

## 6. S3 Glacier Instant Retrieval

**Description:** Instant archive storage class. For data accessed rarely (once per quarter) but must be available immediately when needed.

**How it works:** Stores data in a compressed/archive structure similar to Glacier, but AWS keeps the index in a faster layer to ensure instant response.

**Use cases:** Medical image archives, old insurance claim documents, CCTV footage that may be suddenly requested by authorities.

**Access time:** Milliseconds.

**Cost:** Very low storage cost (similar to Glacier), but the highest per-GB retrieval cost among all instant-response storage options.

**Advantages:** Bridges the gap between Glacier's low price and Standard-IA's instant access requirements.

**Disadvantages:** Penalty fees for frequent data access can escalate quickly. Retention penalties are stricter (90 days).

| Attribute | Value |
|-----------|-------|
| Availability | Minimum 3 AZs (99.9% SLA) |
| Durability | 99.999999999% (11 nines) |
| Minimum Retention | 90 days |
| Minimum Size | 128 KB |

---

## 7. S3 Glacier Flexible Retrieval

**Description:** Traditional archive storage (offline storage) for data accessed 1-2 times per year that can tolerate retrieval delays.

**How it works:** Objects are frozen and cannot be downloaded directly (GET). Users must submit a Restore Request. AWS unpacks the archive to a temporary staging area before it can be downloaded.

**Use cases:** Media recording archives, annual operational data recovery, and passive database backups.

**Access time:** Depends on the retrieval option:
- **Expedited:** 1-5 minutes
- **Standard:** 3-5 hours
- **Bulk:** 5-12 hours (free)

**Cost:** Very low storage cost. Bulk retrieval is free, but faster options incur additional charges.

**Advantages:** Well-balanced option for massive backups due to low storage cost and free bulk retrieval.

**Disadvantages:** Applications or users cannot read files in real-time; data must go through a staging process first.

| Attribute | Value |
|-----------|-------|
| Availability | Minimum 3 AZs (99.99% SLA) |
| Durability | 99.999999999% (11 nines) |
| Minimum Retention | 90 days |
| Minimum Size | 40 KB |

---

## 8. S3 Glacier Deep Archive

**Description:** The deepest and cheapest cold storage class in AWS, designed as a replacement for on-premise tape library systems.

**How it works:** Data is locked in AWS cold-storage infrastructure. Recovery requests enter a long queue (retrieving data from automated tape libraries).

**Use cases:** Legal and regulatory compliance (e.g., medical records or banking data required to be stored for 7-10 years), historical research data kept solely for archival purposes.

**Access time:** Slowest of all. Standard retrieval: 12 hours. Bulk retrieval: up to 48 hours.

**Cost:** Cheapest in AWS S3 (under $1 USD per Terabyte per month). Retrieval fees apply when data is accessed, though rates are low.

**Advantages:** Provides extraordinary cost efficiency for petabyte-scale data volumes mandated by law.

**Disadvantages:** Data is completely non-operational. Up to 2-day wait times make this tier irrelevant for critical system Disaster Recovery.

| Attribute | Value |
|-----------|-------|
| Availability | Minimum 3 AZs (99.99% SLA) |
| Durability | 99.999999999% (11 nines) |
| Minimum Retention | 180 days |
| Minimum Size | 40 KB |

---

## 9. S3 Lifecycle Policies

An automation feature that transfers objects between storage classes or deletes them automatically. For example, deleting logs after 90 days to reduce costs.

---

## 10. S3 Data Protection and Security

### Versioning

Protects data from accidental or intentional deletion and overwriting, and enables recovery.

**How it works:** Every version of an object is stored when uploaded, overwritten, or deleted.

### S3 Object Lock (WORM - Write Once, Read Many)

Prevents objects from being deleted or modified for a specified period.

**How it works:** Applies a policy that restricts deletion of an object in S3 for a defined duration.

**Object Lock Modes:**

| Mode | Description |
|------|-------------|
| **Governance Mode** | Regular users cannot modify or remove this permission. Only administrators can change the retention period. |
| **Compliance Mode** | Once set, no one can alter the object. The only option is to wait for the retention period to expire. |

### Block Public Access

An AWS feature that configures permissions at the bucket or account level to prevent public data exposure on S3 buckets.

| Option | Description | Use Case |
|--------|-------------|----------|
| **BlockPublicAcls** | Rejects creation of new ACLs that grant public access to an S3 bucket. | Prevents developers or cloud administrators from uploading objects with `--acl public-read`. |
| **IgnorePublicAcls** | Ignores all existing public ACLs on the S3 bucket. | Neutralizes risk if objects were previously made public via ACL. Preferred over deleting the ACLs. |
| **BlockPublicPolicy** | Rejects adding or changing permissions that grant open public/internet access (e.g., `principal: "*"`). | Ensures no user can apply or modify a bucket policy with public access. |
| **RestrictPublicBuckets** | Restricts access to buckets with public policies to only AWS services or authenticated users within the same AWS account. | Isolates public-facing buckets so only internal services and users can access them. For public content, use a CDN instead of direct S3 access. |
