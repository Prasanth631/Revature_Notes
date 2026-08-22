# Day 2 — Cloud Fundamentals

---

## 1. Components of Cloud Computing

A cloud environment consists of six major functional components:

1. **Compute**
2. **Storage**
3. **Networking**
4. **Database**
5. **Security (IAM)**
6. **Management & Monitoring**

```text
+-------------------------------------------------------------+
|                   CLOUD CORE COMPONENTS                     |
+-------------------------------------------------------------+
|  [ COMPUTE ]     [ STORAGE ]     [ NETWORKING ]  [ DATABASE]|
|   (CPU/RAM)      (Files/S3)      (VPC/Subnets)    (SQL/NoSQL)
+-------------------------------------------------------------+
|  [ SECURITY & IAM ]           [ MONITORING & LOGGING ]      |
|  (AuthN / AuthZ / Encryption) (CloudWatch / Metrics / Alert)|
+-------------------------------------------------------------+
```

---

### 1.1 Compute

#### Definition
**Compute refers to the processing power (CPU, RAM) used to run application code, process data, and execute instructions.**

> **In simple terms:** Compute = Where your application executes.

#### Cloud Providers & Services
| Cloud Provider | Virtual Machine | Serverless | Container Service |
|---|---|---|---|
| **AWS** | Amazon EC2 | AWS Lambda | Amazon ECS / EKS |
| **Azure** | Azure Virtual Machines | Azure Functions | Azure AKS / Container Apps |
| **GCP** | Google Compute Engine | Cloud Functions | Google Kubernetes Engine (GKE) |

#### Real-Life Example
Suppose you build a Java Spring Boot backend. The application needs CPU cycles and RAM memory to run and respond to user requests:

```text
Java Application  ──>  Compute Resource (EC2 / VM)  ──>  CPU + RAM Execution
```

---

### 1.2 Storage

#### Definition
**Cloud storage provides persistent, highly scalable capacity to store unstructured files, media, backups, and documents over the internet.**

#### Cloud Providers & Services
- **AWS:** Amazon S3 (Simple Storage Service)
- **Azure:** Azure Blob Storage
- **GCP:** Google Cloud Storage (GCS)

#### Real-Life Example
Think of **Instagram or Netflix**: When users upload photos, profile pictures, or stream videos, these media files are stored in cloud object storage:

```text
User  ──>  Uploads Photo (image.jpg)  ──>  Amazon S3 Bucket / Azure Blob
```

---

### 1.3 Networking

#### Definition
**Cloud networking provides the virtual infrastructure to securely connect cloud resources, manage IP addresses, isolate subnets, and route traffic between users and applications.**

#### Key Networking Concepts
- **VPC / VNet:** Isolated virtual private network for your cloud resources.
- **Subnets:** Subdivisions of a network (Public subnets for web servers, Private subnets for databases).
- **Load Balancers:** Distributes incoming traffic across multiple backend servers.
- **Firewalls / Security Groups:** Controls allowed incoming and outgoing traffic.

#### Cloud Providers & Services
- **AWS:** Amazon VPC, Route 53, Elastic Load Balancing (ALB)
- **Azure:** Azure Virtual Network (VNet), Azure Load Balancer
- **GCP:** Google Virtual Private Cloud (VPC), Cloud Load Balancing

---

### 1.4 Database

#### Definition
**Cloud databases are managed systems designed to store, query, and manage structured and unstructured application data with automated backups, scaling, and high availability.**

#### Cloud Providers & Services
| Database Type | AWS | Azure | GCP |
|---|---|---|---|
| **Relational (SQL)** | Amazon RDS / Aurora | Azure SQL Database | Google Cloud SQL / Spanner |
| **NoSQL (Key-Value / Doc)** | Amazon DynamoDB | Azure Cosmos DB | Google Firestore / Bigtable |

#### Real-Life Example
When you purchase an item on Amazon:

```text
Customer places order  ──>  Application Backend  ──>  Database (Stores Order ID, Amount, Address)
```

---

### 1.5 Security (IAM & Encryption)

Cloud security protects applications, data, users, and infrastructure.

#### Authentication vs. Authorization (⭐ *Classic Interview Question*)
- **Authentication (AuthN):** *"Who are you?"* $\rightarrow$ Verifying user identity (e.g., Username + Password, MFA).
- **Authorization (AuthZ):** *"What are you allowed to do?"* $\rightarrow$ Determining access permissions (e.g., Normal user can view products; Admin can delete products).

```text
Authentication  ──>  Verifies Identity  (Login with OTP/Password)
Authorization   ──>  Verifies Permissions (Admin vs. Read-Only Viewer)
```

---

### 1.6 Management & Monitoring

Cloud environments must be monitored continuously for performance, uptime, and costs.

#### Key Metrics Tracked:
- CPU & Memory utilization %
- Server health & error rates (HTTP 500s)
- Live traffic & latency
- Monthly billing alerts

#### Cloud Providers & Services
- **AWS:** Amazon CloudWatch, AWS CloudTrail
- **Azure:** Azure Monitor
- **GCP:** Google Cloud Monitoring

---

## 2. Cloud Architecture & The 3-Tier Model

A standard production application is built using a **Three-Tier Architecture** to ensure separation of concerns, scalability, and security.

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

---

### 2.1 Presentation Layer (Tier 1)
- The **User Interface (UI)** that clients interact with directly via web browsers or mobile apps (e.g., React, HTML/CSS, Mobile Client).

### 2.2 Application Layer (Tier 2)
- Contains the core **business logic** (e.g., Java Spring Boot, Python FastAPI, Node.js).
- Handles actions like validating payments, processing orders, and authenticating users.

### 2.3 Data Layer (Tier 3)
- Stores persistent application data (e.g., MySQL, PostgreSQL, DynamoDB, Amazon S3 for media).

---

## 3. Benefits of Cloud Computing

| Benefit | Explanation | Real-World Impact |
|---|---|---|
| **1. Cost Savings** | Shift from upfront CapEx to pay-as-you-go OpEx | No expensive physical server purchases |
| **2. Scalability** | Ability to handle growing workloads | Scale from 10 to 10,000 servers |
| **3. Elasticity** | Automatically adds/removes resources based on demand | Auto-scale up during sales, shrink after |
| **4. High Availability** | Built-in redundancy across multiple data centers | 99.99% uptime; zero single point of failure |
| **5. Global Reach** | Deploy in international regions with low latency | Serve users in US, India, Europe instantly |
| **6. Fast Deployment** | Spin up complete environments in minutes | Faster time-to-market for software releases |
| **7. Backup & DR** | Automated cross-region replication | Instant disaster recovery if a region fails |

---

## 4. Challenges of Cloud Computing

Interviewers often ask: *"What are the limitations or challenges of the cloud?"*

1. **Security & Misconfiguration:** Misconfigured storage buckets or weak IAM roles can expose data.
2. **Cost Management & Bill Shock:** Forgetting to terminate unused VMs or unmonitored egress bandwidth leads to high bills.
3. **Vendor Lock-in:** Relying on proprietary cloud APIs makes migrating to another cloud difficult.
4. **Internet Dependency:** Workloads require reliable network connectivity.
5. **Compliance & Data Sovereignty:** Strict laws (HIPAA, GDPR) dictate where customer data must be stored geographically.
6. **Shared Responsibility Risk:** Customers often mistakenly assume the cloud provider handles all application-level security.

---

## 5. The Shared Responsibility Model (⭐ Critical Interview Topic)

Security in the cloud is a **shared partnership** between the cloud provider and the customer:

```text
+-----------------------------------------------------------------------------+
|                      SHARED RESPONSIBILITY MODEL                            |
+-----------------------------------------------------------------------------+

 CUSTOMER RESPONSIBILITY:  "Security IN the Cloud"
 --------------------------------------------------
 • Customer Data & Encryption
 • User Identity & Access Management (IAM)
 • Operating System Patches (in IaaS)
 • Network Firewall / Security Group rules
 • Application Code & Logic

 ==================================================

 CLOUD PROVIDER RESPONSIBILITY:  "Security OF the Cloud"
 -------------------------------------------------------
 • Physical Data Centers & Facilities
 • Server Hardware & Power Backup
 • Hypervisor & Virtualization Layer
 • Physical Network Infrastructure
+-----------------------------------------------------------------------------+
```

---

## 6. Types of Data (Structured, Semi-Structured, Unstructured)

Data in modern cloud applications falls into three primary categories:

```text
                               DATA TYPES
                                   |
         -----------------------------------------------------
         |                         |                         |
     STRUCTURED             SEMI-STRUCTURED             UNSTRUCTURED
         |                         |                         |
   • Rigid Schema             • Flexible Schema          • No Fixed Schema
   • Rows & Columns           • Keys, Tags, Metadata     • Media & Documents
   • Tables (SQL/CSV)         • JSON, XML, YAML          • Images, Videos, PDFs
```

---

### 6.1 Structured Data

#### Definition
**Structured data is data organized according to a strict, predefined schema, formatted in rows and columns.**

#### Examples:
- Relational Database Tables (MySQL, PostgreSQL, Oracle)
- Spreadsheets (Excel) & CSV files

#### Example Table:
| Student_ID | Name | Age | Department |
|:---:|:---|:---:|:---|
| 101 | Prasanth | 22 | Computer Science |
| 102 | Priya | 23 | Information Tech |
| 103 | Arun | 21 | Electronics |

---

### 6.2 Semi-Structured Data

#### Definition
**Semi-structured data does not conform to a rigid relational table structure, but contains tags, keys, or metadata that provide internal organization.**

#### JSON Example (Key-Value / Hierarchical):
```json
{
  "id": 101,
  "name": "Prasanth",
  "skills": ["Java", "SQL", "Cloud"]
}
```

#### XML Example (Tags):
```xml
<student>
    <id>101</id>
    <name>Prasanth</name>
    <skills>Java, SQL, Cloud</skills>
</student>
```

---

### 6.3 Unstructured Data

#### Definition
**Unstructured data has no predefined data model, schema, or tabular structure.** It accounts for over 80% of all enterprise data.

#### Examples:
- Media files: Photos (`.jpg`, `.png`), Videos (`.mp4`, `.mkv`), Audio (`.mp3`)
- Documents: PDFs (`.pdf`), Word files (`.docx`), Plain Text (`.txt`)
- Social media posts, emails, log streams

---

## 7. Structured vs. Semi-Structured vs. Unstructured Comparison

| Feature | Structured | Semi-Structured | Unstructured |
|---|---|---|---|
| **Schema** | Predefined & Rigid | Flexible / Self-describing | None / Dynamic |
| **Data Format** | Tables (Rows & Columns) | Key-Value, Tags (JSON/XML) | Binary, Media, Text |
| **Storage Technology** | Relational DB (RDS, MySQL)| NoSQL DB, Document Store | Object Storage (S3, Blob) |
| **Query Language** | SQL | JSONPath, XQuery, NoSQL APIs | Metadata search, NLP, OCR |
| **Flexibility** | Low (Schema changes hard) | High | Maximum |
| **Primary Examples** | SQL Tables, CSV | JSON, XML, YAML | Images, Videos, PDFs |

---

## 8. Common File Types in Cloud & Data Systems

```text
+-------------------+----------------------+------------------------------------+
| File Extension    | Data Type Category   | Typical Cloud Use Case             |
+-------------------+----------------------+------------------------------------+
| .csv              | Structured           | Tabular export, data exchange      |
| .json             | Semi-Structured      | REST APIs, web apps, configuration |
| .xml              | Semi-Structured      | Enterprise integrations, config    |
| .txt              | Unstructured         | Plain text notes, logs             |
| .pdf              | Unstructured         | Invoices, reports, certificates    |
| .jpg / .png       | Unstructured         | Product images, profile photos     |
| .mp3 / .wav       | Unstructured         | Audio recordings, voice messages   |
| .mp4 / .mkv       | Unstructured         | Video streaming, CCTV footage      |
| .parquet / .orc   | Structured (Columnar)| Big Data analytics, Data Lakes     |
| .avro             | Semi-Structured      | Event streaming (Kafka pipelines)  |
+-------------------+----------------------+------------------------------------+
```

### CSV vs. JSON (⭐ *Frequent Interview Comparison*)
- **CSV:** Best for flat, simple 2D tabular rows and columns. Lightweight, but cannot easily represent nested or hierarchical data.
- **JSON:** Best for nested, hierarchical data objects and REST API communication.

---

## 9. Real-World End-to-End Flow: E-Commerce Platform

Putting all Day 2 concepts together:

```text
                                [ ONLINE CUSTOMER ]
                                         |
                                         v
                            [ Application Load Balancer ]
                                         |
                                         v
                         [ Compute: EC2 / App Service ]
                                         |
          +------------------------------+------------------------------+
          |                              |                              |
          v                              v                              v
  [ STRUCTURED DATA ]          [ SEMI-STRUCTURED DATA ]       [ UNSTRUCTURED DATA ]
   Managed RDS MySQL                REST API Payload             Amazon S3 Bucket
  • Customer Table             • Order JSON message           • Product images (.png)
  • Payments Table             • Config settings              • Invoice PDFs (.pdf)
```

- **Compute:** Executes application microservices.
- **Networking:** Route 53 + VPC + Load Balancer routes traffic safely.
- **Security:** IAM roles restrict database access only to application servers.
- **Monitoring:** CloudWatch tracks server CPU and triggers auto-scaling when CPU > 70%.

---

## 10. Most Important Interview Questions (Day 2 Checklist)

1. **What are the 6 core components of cloud computing?**
2. **Explain the 3-Tier Architecture with an example.**
3. **What is the difference between Authentication and Authorization?**
4. **Explain the Shared Responsibility Model for cloud security.**
5. **What are the key benefits and limitations/challenges of cloud computing?**
6. **What is the difference between Structured, Semi-Structured, and Unstructured data?**
7. **Give examples of file formats for Structured, Semi-Structured, and Unstructured data.**
8. **When would you choose JSON over CSV?**
9. **What is Parquet format and why is it used in cloud analytics?**

---

## 11. Rapid-Fire Revision Sheet (5-Minute Prep)

- **Compute:** CPU/RAM capacity to run applications (*AWS EC2, Lambda*).
- **Storage:** Object/file store for unstructured data (*Amazon S3, Azure Blob*).
- **Networking:** Virtual networks connecting cloud assets (*VPC, Subnets, ALB*).
- **Database:** Structured and NoSQL storage systems (*RDS, DynamoDB*).
- **Authentication:** Verifying who you are (Login/Password).
- **Authorization:** Verifying what you are allowed to access (Permissions/Roles).
- **3-Tier Architecture:** Presentation Layer $\rightarrow$ Application Layer $\rightarrow$ Data Layer.
- **Security OF the Cloud:** Cloud provider manages hardware, facilities, and hypervisor.
- **Security IN the Cloud:** Customer manages OS patches, IAM, firewall rules, and data encryption.
- **Structured Data:** Fixed schema in tables (SQL, CSV).
- **Semi-Structured Data:** Flexible schema with keys/tags (JSON, XML).
- **Unstructured Data:** No fixed schema (Images, Videos, PDFs, Text).
- **Parquet:** Columnar storage format optimized for fast analytics queries.

---

### 💡 Combined Day 1 + Day 2 Mental Summary
> *"A cloud provider offers compute, storage, networking, database, and security services. Modern applications are built on multi-tier architectures using load balancers and auto-scaling. While the cloud provides high availability, scalability, elasticity, and cost savings, teams must navigate security, cost management, vendor lock-in, and compliance under the Shared Responsibility Model. The underlying data processed spans structured (SQL/CSV), semi-structured (JSON/XML), and unstructured (media/PDFs) formats stored across relational databases and scalable cloud object storage."*
