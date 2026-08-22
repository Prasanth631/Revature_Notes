# Day 2 — Cloud Fundamentals

---

## 1. Components of Cloud Computing

A cloud environment is built from six fundamental components:

---

### 1.1 Compute

### What is it?
The processing power (CPU, RAM) used to execute application code, process data, and run software.

### Why is it used?
Every software program requires CPU cycles and memory to process user requests and execute logic.

### How is it used?
You deploy application code into Virtual Machines (EC2), Docker containers (ECS/EKS), or Serverless functions (Lambda).

### Real-Life Example
**Car Engine:** Just as a car needs an engine to generate power and move, an application needs compute resources to execute instructions.

### Cloud Example
- **AWS:** Amazon EC2, AWS Lambda, Amazon ECS
- **Azure:** Azure Virtual Machines, Azure Functions
- **GCP:** Google Compute Engine, Cloud Functions

---

### 1.2 Storage

### What is it?
Persistent, scalable digital space used to store unstructured files, media, backups, and documents.

### Why is it used?
Applications generate and serve large static files (photos, videos, logs, PDFs) that should not be stored inside temporary VM memory.

### How is it used?
Applications upload and download files directly via REST APIs or SDKs into cloud object storage buckets.

### Real-Life Example
**Bank Locker / Storage Unit:** A safe, dedicated place where you store all your physical files, albums, and valuables.

### Cloud Example
- **AWS:** Amazon S3 (Simple Storage Service)
- **Azure:** Azure Blob Storage
- **GCP:** Google Cloud Storage (GCS)

---

### 1.3 Networking

### What is it?
The virtual infrastructure that connects cloud resources together and enables secure communication between users and applications over the internet.

### Why is it used?
Without networking, isolated servers cannot talk to databases, load balancers cannot distribute traffic, and users cannot access the website.

### How is it used?
You create a Virtual Private Cloud (VPC), configure Public/Private subnets, route tables, and define firewall rules (Security Groups).

### Real-Life Example
**Roads and Traffic Signals:** The roads connect houses and shops, while traffic police ensure only authorized vehicles enter specific lanes.

### Cloud Example
- **AWS:** Amazon VPC, Application Load Balancer (ALB), Route 53
- **Azure:** Azure Virtual Network (VNet), Azure Load Balancer
- **GCP:** Google Cloud VPC, Cloud Load Balancing

---

### 1.4 Database

### What is it?
Managed software systems engineered to store, organize, and query structured and non-relational business data.

### Why is it used?
Ensures transactional integrity, fast searching, automated backups, and data persistence for application records.

### How is it used?
Backend code connects via JDBC/ODBC drivers to execute SQL queries or NoSQL document reads/writes.

### Real-Life Example
**Hospital Filing System / Account Ledger:** A systematically organized record book where every patient's details and prescription history can be retrieved instantly.

### Cloud Example
- **AWS:** Amazon RDS (MySQL/PostgreSQL), Amazon DynamoDB (NoSQL)
- **Azure:** Azure SQL Database, Azure Cosmos DB
- **GCP:** Google Cloud SQL, Cloud Firestore

---

### 1.5 Security & IAM (Identity and Access Management)

### What is it?
Security systems and policies that control who can log in (Authentication) and what actions they are permitted to perform (Authorization).

### Why is it used?
Prevents unauthorized access, protects sensitive customer data, and satisfies compliance standards.

### How is it used?
Administrators create IAM users, assign Least Privilege roles, enforce Multi-Factor Authentication (MFA), and enable data encryption.

### Real-Life Example
**Airport Security & Boarding Pass:**
- **Authentication (Who are you?):** Passport check at security gates.
- **Authorization (What can you do?):** Boarding pass allowing you to enter only your assigned flight and seat.

### Cloud Example
- **AWS:** AWS IAM, AWS KMS (Key Management Service)
- **Azure:** Microsoft Entra ID (formerly Azure AD)
- **GCP:** Google Cloud IAM

---

### 1.6 Management & Monitoring

### What is it?
Tools that track application health, server performance metrics, error logs, and cloud spending in real time.

### Why is it used?
Allows developers and system administrators to detect system crashes, handle traffic spikes, and avoid bill shocks before they impact users.

### How is it used?
Dashboards display CPU usage charts, log streams, and trigger automated alerts (email/SMS) when errors cross a threshold.

### Real-Life Example
**Car Dashboard:** Speedometer and warning lights that alert you if the engine overheats or fuel runs low.

### Cloud Example
- **AWS:** Amazon CloudWatch, AWS CloudTrail
- **Azure:** Azure Monitor
- **GCP:** Google Cloud Monitoring

---

## 2. Three-Tier Cloud Architecture

### What is it?
A standard architectural pattern that separates an application into three distinct logical layers: **Presentation Tier**, **Application Tier**, and **Data Tier**.

```text
                    [ USERS / CLIENTS ]
                             |
                         (Internet)
                             |
                             v
               +---------------------------+
               |  APPLICATION LOAD BALANCER|
               +---------------------------+
                             |
        +--------------------+--------------------+
        |                                         |
        v                                         v
+-------------------------+             +-------------------------+
|    PRESENTATION TIER    |             |    PRESENTATION TIER    |
|   (Web Server / React)  |             |   (Web Server / React)  |
+-------------------------+             +-------------------------+
        |                                         |
        +--------------------+--------------------+
                             |
                             v
               +---------------------------+
               |     APPLICATION TIER      |
               | (Business Logic: Java/API)|
               +---------------------------+
                             |
                 +-----------+-----------+
                 |                       |
                 v                       v
        +-----------------+     +-----------------+
        |    DATA TIER    |     |   OBJECT STORAGE|
        |  (Database/SQL) |     |   (Images/S3)   |
        +-----------------+     +-----------------+
```

### The 3 Layers Explained:
1. **Presentation Layer (Tier 1):** The user interface (React, mobile app, HTML) that users interact with.
2. **Application Layer (Tier 2):** The business logic (Java Spring Boot, Python, Node.js) that processes rules and calculations.
3. **Data Layer (Tier 3):** The persistent storage (MySQL, PostgreSQL, Amazon S3) that stores application records and media.

### Why is it used?
- **Modularity:** Upgrading or modifying one layer doesn't break the others.
- **Security:** The database sits in a private subnet, completely isolated from direct public internet access.
- **Independent Scaling:** Scale the web servers during sales without having to alter the database tier.

---

## 3. Benefits of Cloud Computing

| Benefit | What it means | Why it matters |
|---|---|---|
| **1. Cost Savings** | Pay only for what you use | No huge upfront capital investment (OpEx model) |
| **2. Scalability** | Capacity to grow resources | Easily handle customer growth from 100 to 100,000 |
| **3. Elasticity** | Auto-grow and auto-shrink based on live traffic | Save money during low-traffic nights; handle flash sales |
| **4. High Availability** | 99.99% uptime via multi-datacenter redundancy | If one server or data center fails, others take over seamlessly |
| **5. Global Reach** | Deploy across global regions in clicks | Low latency for international customers worldwide |
| **6. Fast Deployment** | Spin up environments in minutes | Shorter release cycles and faster time to market |
| **7. Disaster Recovery** | Automated cross-region backups | Recover systems in minutes during catastrophic failures |

---

## 4. Challenges of Cloud Computing

| Challenge | Explanation | How to Solve |
|---|---|---|
| **1. Security Misconfiguration** | Incorrect IAM permissions or public buckets | Apply Principle of Least Privilege & automated audits |
| **2. Cost Management** | Unused running VMs causing bill shock | Set billing alarms and auto-shutdown idle servers |
| **3. Vendor Lock-in** | Dependency on proprietary cloud APIs | Use open-source tools, containers (Docker/K8s) |
| **4. Internet Dependency** | Connectivity needed to access cloud apps | Use redundant network connections & edge caching |
| **5. Compliance & Regulation** | Laws requiring data to stay in-country (GDPR) | Choose cloud regions compliant with local laws |

---

## 5. The Shared Responsibility Model

### What is it?
A security framework defining which security tasks are handled by the cloud provider and which are handled by the customer.

```text
CLOUD PROVIDER RESPONSIBILITY:   "Security OF the Cloud"
(Hardware, Physical Data Centers, Power, Host Virtualization, Core Networking)

CUSTOMER RESPONSIBILITY:         "Security IN the Cloud"
(Customer Data, User IAM Access, OS Patching in IaaS, Firewall Rules, App Code)
```

---

## 6. Types of Data

---

### 6.1 Structured Data

### What is it?
Data formatted according to a rigid, predefined tabular schema organized in rows and columns.

### Characteristics & Storage
- Highly organized, easy to query using standard **SQL**.
- **Stored in:** Relational Databases (MySQL, PostgreSQL, Oracle, SQL Server).
- **Examples:** Banking transactions, employee database tables, CSV exports.

---

### 6.2 Semi-Structured Data

### What is it?
Data that does not fit into strict 2D tables, but contains internal markers, keys, or tags that provide organization.

### Characteristics & Storage
- Flexible, self-describing, supports nested/hierarchical structures.
- **Stored in:** NoSQL Document Databases (MongoDB, DynamoDB) or file systems.
- **Examples:** JSON documents, XML feeds, YAML configuration files.

---

### 6.3 Unstructured Data

### What is it?
Data that has no predefined structure, schema, or tabular organization. Accounts for ~80% of all digital data.

### Characteristics & Storage
- Binary, media, or raw human-readable content.
- **Stored in:** Cloud Object Storage (Amazon S3, Azure Blob Storage).
- **Examples:** Photos (`.jpg`), Videos (`.mp4`), PDFs (`.pdf`), Audio (`.mp3`), Plain text notes.

---

### Data Types Comparison Table
| Feature | Structured | Semi-Structured | Unstructured |
|---|---|---|---|
| **Schema** | Predefined & Rigid | Flexible / Self-describing | None |
| **Organization** | Rows & Columns | Key-Value / Tags | Binary / Raw Media |
| **Query Method** | SQL Queries | JSONPath / NoSQL APIs | Metadata search / NLP / OCR |
| **Storage** | Relational DB (RDS) | NoSQL / Document DB | Object Storage (Amazon S3) |
| **Top Examples** | SQL Tables, CSV | JSON, XML, YAML | Images, Videos, PDFs, Logs |

---

## 7. Cloud File Types Reference

| Format | Category | Description & Usage |
|---|---|---|
| **.csv** | Structured | Comma-Separated Values; simple tabular data export. |
| **.json** | Semi-Structured | JavaScript Object Notation; lightweight, nested data used in REST APIs. |
| **.xml** | Semi-Structured | Tag-based markup language used in enterprise legacy systems. |
| **.txt** | Unstructured | Plain text files and raw log files. |
| **.pdf** | Unstructured | Document format used for digital reports, invoices, and certificates. |
| **.jpg / .png** | Unstructured | Image files stored in cloud object storage. |
| **.mp4 / .mkv** | Unstructured | Video media files for streaming and recording. |
| **.parquet / .orc** | Structured (Columnar)| High-performance columnar storage format used in Big Data analytics & Data Lakes. |
| **.avro** | Semi-Structured | Binary serialization format with schema evolution used in event streaming (Kafka). |

---

## 8. CSV vs. JSON

- **CSV (Comma-Separated):** Best for flat 2D rows and columns. Lightweight and human-readable, but cannot naturally represent nested objects or lists.
- **JSON (Object Notation):** Best for hierarchical, nested structures and web API communications.

```json
// JSON easily handles nested arrays and objects:
{
  "id": 101,
  "name": "Prasanth",
  "skills": ["Java", "SQL", "Cloud"]
}
```

---

## 9. Day 2 Quick Interview Revision (One-Liners)

- **Compute:** CPU and RAM processing power (*AWS EC2, Lambda*).
- **Storage:** Scalable object store for unstructured media (*Amazon S3, Azure Blob*).
- **Networking:** Virtual networks connecting cloud assets (*VPC, Subnets, ALB*).
- **Database:** Managed relational and NoSQL storage systems (*RDS, DynamoDB*).
- **Authentication:** Verifying user identity (*Who are you?*).
- **Authorization:** Verifying permissions (*What are you allowed to do?*).
- **Three-Tier Architecture:** Presentation (UI) $\rightarrow$ Application (Logic) $\rightarrow$ Data (Database).
- **Security OF the Cloud:** Provider manages hardware, data center facilities, and hypervisors.
- **Security IN the Cloud:** Customer manages OS patching, IAM roles, firewall rules, and data encryption.
- **Structured Data:** Fixed tabular rows and columns (SQL, CSV).
- **Semi-Structured Data:** Flexible keys and tags (JSON, XML).
- **Unstructured Data:** No fixed schema (Images, Videos, PDFs, Audio).
- **Parquet:** Columnar storage format optimized for Big Data analytics.
