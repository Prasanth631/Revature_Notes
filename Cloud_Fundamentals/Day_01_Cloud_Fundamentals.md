# Day 1 — Cloud Fundamentals

---

## 1. What is Cloud Computing?

### Definition
**Cloud computing is the delivery of computing resources such as servers, storage, databases, networking, software, and processing power over the internet, usually on a pay-as-you-go basis.**

Instead of buying and maintaining physical servers yourself, you can rent the resources you need from a cloud provider.

### Traditional Approach
Suppose a company wants to build an application:

```text
Company
   |
   +-- Buy physical servers
   +-- Buy storage
   +-- Set up networking
   +-- Install operating systems
   +-- Maintain hardware
   +-- Pay electricity costs
   +-- Hire administrators
```
This requires a lot of money and upfront maintenance.

### Cloud Approach
The company can use:

```text
Company
   |
   +---- Internet ----> Cloud Provider
                            |
                            +-- Servers
                            +-- Storage
                            +-- Database
                            +-- Networking
```
The company pays only for what it uses.

### Real-Life Example
Think about electricity. You don't build your own power plant just because you need electricity.

```text
Electricity provider  ──>  You consume electricity  ──>  You pay based on usage
Cloud provider        ──>  You consume resources    ──>  You pay based on usage
```

### Interview Answer
**"What is cloud computing?"**

> "Cloud computing is the on-demand delivery of computing resources such as servers, storage, databases, networking, and software over the internet. Users can provision these resources when required and generally pay based on their usage instead of purchasing and maintaining physical infrastructure."

---

## 2. Cloud Model Types (Deployment Models)

When interviewers say **"cloud models"**, they usually mean:
1. **Public Cloud**
2. **Private Cloud**
3. **Hybrid Cloud**
4. **Community Cloud**

---

### 2.1 Public Cloud

#### Definition
A **public cloud** is a cloud environment where infrastructure is owned and operated by a cloud provider and resources are made available to multiple customers over the internet.

Examples: **AWS, Microsoft Azure, Google Cloud (GCP)**.

```text
                 AWS Infrastructure
                          |
        -------------------------------------
        |                 |                 |
     User A            User B            User C
```
Multiple customers use the provider's infrastructure while their data is logically isolated.

#### Real-Life Example
Think of an **apartment building**. The building belongs to the owner, but different tenants rent and live in separate flats independently.

#### Advantages
- Lower initial cost (No hardware purchase)
- Highly scalable
- Zero physical maintenance
- Pay-as-you-go
- Fast deployment

---

### 2.2 Private Cloud

#### Definition
A **private cloud** is a cloud environment dedicated to a single organization. The infrastructure is not shared with other organizations.

```text
                Organization
                     |
              Private Cloud
                     |
        -------------------------
        |          |            |
    Application Database     Storage
```

#### Real-Life Example
Think about **owning your own private house**. Nobody else shares your house; you have complete privacy and control, but you bear all construction and maintenance costs.

#### Advantages & Disadvantages
- **Advantages:** Greater control, custom security, dedicated infrastructure, regulatory compliance.
- **Disadvantages:** Expensive (High CapEx), requires in-house IT staff and hardware maintenance.

---

### 2.3 Hybrid Cloud

#### Definition
A **hybrid cloud** combines **private cloud/on-premises infrastructure with public cloud infrastructure**, allowing workloads and data to move between both environments.

```text
             Company
                |
        -----------------
        |               |
   Private Cloud     Public Cloud
        |               |
 Sensitive Data      Web Application
```

#### Real-Life Example
A bank keeps sensitive customer account data in its **Private Cloud** (for compliance) while hosting its public marketing website and mobile app on a **Public Cloud** (for elastic scale).

#### Interview Question
**Q: Why would a company choose hybrid cloud?**

> "A company uses hybrid cloud when it wants to keep sensitive data and core systems in a private, compliant environment while leveraging the elasticity, cost savings, and scalability of the public cloud for web applications and dynamic workloads."

---

## 3. Cloud Service Models (IaaS, PaaS, SaaS)

There are three major service models you must know for interviews:

```text
IaaS → You manage more (Infrastructure)
PaaS → Provider manages platform; you write code (Platform)
SaaS → Provider manages everything; you just use it (Software)
```

---

## 4. IaaS — Infrastructure as a Service

### Definition
**IaaS provides fundamental computing infrastructure such as virtual machines, storage, and networking over the internet.**

```text
Provider Manages:                  You Manage:
-----------------                  -----------
• Physical servers                 • Operating System (OS)
• Storage & Networking hardware    • Applications & Code
• Data center & Virtualization     • Data & Configurations
```

### Real-Life Example
**Renting an empty apartment:** The building and walls are provided, but you decide your furniture, appliances, and how you set up the rooms.

### IaaS Examples
| Provider | Service |
|---|---|
| **AWS** | Amazon EC2 |
| **Azure** | Azure Virtual Machines |
| **GCP** | Google Compute Engine |

### When to Use IaaS?
When you need **maximum control over the OS and network**, or when migrating legacy applications to the cloud without redesigning them.

---

## 5. PaaS — Platform as a Service

### Definition
**PaaS provides a pre-configured platform and runtime where developers can build, deploy, and run applications without managing the underlying servers or operating systems.**

```text
Provider Manages:                  You Manage:
-----------------                  -----------
• Servers & Storage                • Application Code
• Networking & Firewalls           • Application Data
• OS & Runtime Environment
```

### Real-Life Example
**A fully equipped commercial kitchen:** You don't buy the oven, refrigerator, or gas connection. You simply bring your ingredients, cook your recipe, and serve.

### PaaS Examples
| Provider | Service |
|---|---|
| **AWS** | AWS Elastic Beanstalk |
| **Azure** | Azure App Service |
| **GCP** | Google App Engine |

### When to Use PaaS?
When developers want to **focus 100% on writing code and shipping features** without wasting time managing and patching servers.

---

## 6. SaaS — Software as a Service

### Definition
**SaaS is a complete software application delivered over the internet where the cloud provider manages the entire application and underlying infrastructure.** You simply log in and use it.

```text
Provider Manages: Everything (Hardware, OS, Code, Updates, Backups)
You Manage:       Your User Profile & Settings
```

### Real-Life Example
**Dining at a restaurant:** You don't buy ingredients, cook, or clean dishes. You sit down, order food, eat, and pay.

### SaaS Examples
- **Email & Office:** Gmail, Google Docs, Microsoft 365
- **Business Tools:** Salesforce, Dropbox, Zoom

---

## 7. IaaS vs PaaS vs SaaS Comparison

| Feature | IaaS | PaaS | SaaS |
|---|---|---|---|
| **Full Form** | Infrastructure as a Service | Platform as a Service | Software as a Service |
| **Infrastructure** | Cloud Provider | Cloud Provider | Cloud Provider |
| **OS & Runtime** | **You Manage** | Cloud Provider | Cloud Provider |
| **Application & Code** | **You Manage** | **You Manage** | Cloud Provider |
| **Data** | **You Manage** | **You Manage** | User Managed |
| **Level of Control** | High | Medium | Low |
| **Target User** | SysAdmins / DevOps | Developers | End Users |
| **Top Example** | AWS EC2 | Azure App Service | Gmail / Microsoft 365 |

### Quick Memory Rule:
```text
IaaS → Manage Infrastructure (EC2)
PaaS → Deploy Code (Elastic Beanstalk)
SaaS → Use Application (Gmail)
```

---

## 8. Major Cloud Providers: AWS, Azure, and GCP

### 8.1 AWS (Amazon Web Services)
- Amazon's cloud platform; first mover and largest global market share.
- Core Services: **EC2** (Compute), **S3** (Storage), **RDS** (Database), **Lambda** (Serverless), **VPC** (Networking).

### 8.2 Microsoft Azure
- Microsoft's cloud platform; deeply integrated with enterprise Microsoft tools (Active Directory, Windows Server, .NET, SQL Server).
- Core Services: **Azure VMs** (Compute), **Blob Storage** (Storage), **Azure SQL** (Database), **Azure Functions** (Serverless), **VNet** (Networking).

### 8.3 Google Cloud Platform (GCP)
- Google's cloud platform; known for Big Data, AI/ML, and container leadership (Kubernetes).
- Core Services: **Compute Engine** (Compute), **Cloud Storage** (Storage), **Cloud SQL** (Database), **Cloud Functions** (Serverless), **GKE** (Kubernetes).

---

## 9. Hyperscaler Service Mapping

| Category | AWS | Azure | GCP |
|---|---|---|---|
| **Virtual Machine (VM)** | EC2 | Virtual Machines | Compute Engine |
| **Object Storage** | S3 | Blob Storage | Cloud Storage |
| **Relational Database** | RDS | Azure SQL | Cloud SQL |
| **Serverless Functions** | Lambda | Azure Functions | Cloud Functions |
| **Managed Kubernetes** | EKS | AKS | GKE |
| **Virtual Network** | VPC | VNet | VPC |

### Interview Answer
**"What are AWS, Azure, and GCP?"**

> "AWS, Microsoft Azure, and Google Cloud Platform (GCP) are the leading public cloud providers that offer on-demand computing, storage, networking, databases, and AI services globally with pay-as-you-go pricing."

---

## 10. Cloud Pricing & Economics

In traditional IT, you buy a physical server for high upfront cost regardless of how much you use it. In the cloud, you pay based on consumption.

### 10.1 Key Pricing Concepts
- **Pay-as-you-go:** Pay only for the exact seconds/hours your resources run.
- **Free Tier:** Free limited monthly allowances provided by cloud vendors for learning and testing.

### 10.2 Pricing Models
1. **On-Demand:**
   - Pay per second/hour with zero long-term commitment.
   - Best for: Unpredictable, short-term, or development workloads.
2. **Reserved / Commitment-Based:**
   - Commit to 1 or 3 years of usage for up to **72% discount**.
   - Best for: Predictable, steady-state 24/7 production workloads.
3. **Spot / Preemptible:**
   - Bid on spare unused cloud capacity for up to **90% discount**.
   - *Catch:* The cloud provider can reclaim the server with short notice if demand surges.
   - Best for: Fault-tolerant batch jobs, video rendering, and CI/CD pipelines.

---

## 11. CapEx vs OpEx

| Feature | CapEx (Capital Expenditure) | OpEx (Operational Expenditure) |
|---|---|---|
| **Meaning** | Upfront money spent on physical assets | Ongoing operational expenses as you consume |
| **Payment** | Paid upfront before using | Paid periodically based on usage |
| **Ownership** | You own and maintain hardware | Cloud provider owns hardware |
| **Model** | Traditional On-Premises | Cloud Computing |

### Interview Question
**Q: Why do companies move from CapEx to OpEx using the cloud?**

> "Instead of spending large capital upfront on physical servers, data centers, and maintenance (CapEx), companies use the cloud to pay only for the computing resources they consume on an ongoing basis (OpEx), reducing financial risk and increasing agility."

---

## 12. Scalability vs Elasticity

```text
Scalability  ──>  Ability to handle increased workload by adding resources.
Elasticity   ──>  Ability to AUTOMATICALLY scale resources up and down based on demand.
```

### Example:
- **Scalability:** Upgrading from 2 servers to 10 servers when your business grows over the year.
- **Elasticity:** An e-commerce app automatically scaling from 2 servers to 20 servers during a 3-hour flash sale, and automatically shrinking back to 2 servers when the sale ends.

---

## 13. Vertical vs Horizontal Scaling

### Vertical Scaling (Scale Up)
Increase the capacity/power of an existing machine (Add more RAM/CPU).
```text
[ 4 GB RAM, 2 CPU ]  ───(Scale Up)───>  [ 32 GB RAM, 16 CPU ]
```

### Horizontal Scaling (Scale Out)
Add more machines to distribute the load across multiple instances.
```text
[ Server 1 ]  ───(Scale Out)───>  [ Server 1 ] + [ Server 2 ] + [ Server 3 ]
```
> **Interview Note:** Cloud architectures strongly favor **Horizontal Scaling** because it provides high availability and fault tolerance without single points of failure.

---

## 14. Availability
Availability refers to the percentage of time a system remains accessible and operational for users.
- Cloud providers ensure high availability using **redundant hardware, multiple Availability Zones (AZs), load balancers, and automated failover**.

---

## 15. Real-World Architecture Flow: E-Commerce Web Application

```text
                           [ Users ]
                               |
                           (Internet)
                               |
                               v
                     [ Application Load Balancer ]
                               |
                 +-------------+-------------+
                 |                           |
                 v                           v
          [ EC2 Server 1 ]            [ EC2 Server 2 ]
                 |                           |
                 +-------------+-------------+
                               |
                               v
                     [ Managed RDS Database ]
```

- **Load Balancer:** Distributes incoming user traffic evenly across servers.
- **EC2 Instances (Horizontal Scaling):** Runs application code; auto-scales automatically during traffic surges (Elasticity).
- **RDS Database:** Handles persistent transactions with automated daily backups and multi-AZ failover.

---

## 16. Summary Architecture Map

```text
                                CLOUD
                                  |
        -----------------------------------------------------
        |                         |                         |
  Cloud Models             Service Models               Providers
  (Where it lives)        (Who manages what)        (AWS / Azure / GCP)
        |                         |                         |
  • Public                  • IaaS (EC2)              • AWS (Market leader)
  • Private                 • PaaS (Beanstalk)        • Azure (Enterprise)
  • Hybrid                  • SaaS (Gmail)            • GCP (Data & AI)
                                  |
                               Pricing
                                  |
        -----------------------------------------------------
        |                         |                         |
   Pay-as-you-go              On-Demand            Reserved / Spot
```

---

## 17. Most Important Interview Questions (Must-Know Checklist)

1. **What is Cloud Computing?**
2. **What is the difference between Public, Private, and Hybrid Cloud?**
3. **Explain IaaS, PaaS, and SaaS with real-life and cloud examples.**
4. **Compare AWS, Azure, and GCP and give their equivalent core services.**
5. **What is the difference between CapEx and OpEx?**
6. **What is the difference between Scalability and Elasticity?**
7. **What is the difference between Vertical Scaling (Scale Up) and Horizontal Scaling (Scale Out)?**
8. **What are On-Demand, Reserved, and Spot pricing models?**

---

## 18. Quick Revision Sheet (One-Liners)

- **Cloud Computing:** On-demand delivery of IT resources over the internet with pay-as-you-go pricing.
- **Public Cloud:** Multi-tenant infrastructure owned by a provider (AWS, Azure, GCP).
- **Private Cloud:** Single-tenant infrastructure dedicated to one company.
- **Hybrid Cloud:** Mix of Private (on-prem) and Public cloud working together.
- **IaaS:** Provider gives infrastructure (VMs/storage); you manage OS and code (*AWS EC2*).
- **PaaS:** Provider gives platform & OS; you only deploy code (*Azure App Service*).
- **SaaS:** Provider manages everything; you just use the software (*Gmail*).
- **CapEx:** Upfront hardware purchasing expense (On-Premises).
- **OpEx:** Ongoing operational pay-as-you-use billing (Cloud).
- **Scalability:** Ability of a system to grow capacity.
- **Elasticity:** Ability to automatically grow and shrink capacity based on live demand.
- **Vertical Scaling:** Upgrading an existing server (Scale Up).
- **Horizontal Scaling:** Adding more servers (Scale Out).
- **Spot Instances:** Bidding on spare capacity for up to 90% discount (Interruptible).
- **Reserved Instances:** 1-3 year commitment for up to 72% discount.

---

### 💡 Pro Interview Tip
When answering cloud questions, follow this formula:
1. State the **definition** in one crisp sentence.
2. Mention **who manages what**.
3. Give an **AWS/Azure/GCP example**.

> *Example:* "IaaS stands for Infrastructure as a Service, where the cloud provider manages the physical hardware, networking, and virtualization, while the customer manages the operating system, runtime, and application code. An example is AWS EC2."
