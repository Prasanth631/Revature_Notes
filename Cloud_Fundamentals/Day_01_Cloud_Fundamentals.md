# Day 1 — Cloud Fundamentals

---

## 1. Cloud Computing

### What is it?
The on-demand delivery of IT resources (servers, storage, databases, networking, software) over the internet with pay-as-you-go pricing, without buying or maintaining physical data centers.

### Why is it used?
- Eliminates expensive upfront hardware costs.
- Allows instant provisioning of resources in minutes.
- Provides global scale, high availability, and automated disaster recovery.

### How is it used?
Developers and companies log into a cloud provider's web console or CLI, select required resources (e.g., a Linux server with 8GB RAM), and deploy applications instantly.

### Real-Life Example
**Electricity Supply:** You don't build a private power plant to turn on a light bulb at home; you plug into the city power grid, use power as needed, and pay an electricity bill based on units consumed.

### Cloud Example
- **AWS:** Renting an Amazon EC2 virtual server.
- **Azure:** Provisioning an Azure Virtual Machine.
- **GCP:** Launching a Google Compute Engine VM.

---

## 2. Cloud Deployment Models

---

### 2.1 Public Cloud

### What is it?
A multi-tenant cloud environment where hardware and infrastructure are owned and managed by a third-party vendor and shared across multiple customers over the internet.

### Why is it used?
- Lowest cost with zero hardware maintenance.
- Infinite scalability and fast setup.

### How is it used?
Startups and enterprises launch web apps, APIs, and databases directly on public cloud platforms.

### Real-Life Example
**Apartment Building:** Multiple tenants rent separate, secure apartments within the same building owned by a landlord.

### Cloud Example
AWS, Microsoft Azure, Google Cloud Platform (GCP).

---

### 2.2 Private Cloud

### What is it?
A single-tenant cloud environment dedicated exclusively to one organization, hosted on-premises or by a third party.

### Why is it used?
- Maximum security, total hardware control, and strict regulatory compliance.

### How is it used?
Banks, healthcare, and defense organizations deploy sensitive internal databases and core banking systems on private infrastructure.

### Real-Life Example
**Owning an Independent House:** The entire property belongs exclusively to you; nobody else shares it, but you bear all maintenance costs.

### Cloud Example
OpenStack, VMware Private Cloud, AWS Outposts.

---

### 2.3 Hybrid Cloud

### What is it?
A connected environment combining **Private Cloud (on-premises)** and **Public Cloud**, allowing data and applications to move between them securely.

### Why is it used?
- Keeps sensitive data private while leveraging the public cloud's elasticity for high-traffic apps.

### How is it used?
A secure tunnel (VPN / AWS Direct Connect) connects the on-prem database to the public cloud web frontend.

### Real-Life Example
**Using Your Own Car + Uber:** You drive your private car for daily office commute, but book an Uber when traveling to crowded places or during peak hours.

### Cloud Example
Storing patient medical records on an on-premise private database while hosting the public appointment booking portal on AWS.

---

## 3. Cloud Service Models (IaaS, PaaS, SaaS)

```text
IaaS  ──>  Provider gives raw infrastructure; you manage OS, runtime & code.
PaaS  ──>  Provider manages platform & OS; you only deploy code & data.
SaaS  ──>  Provider manages everything; you simply use the finished app.
```

---

### 3.1 IaaS (Infrastructure as a Service)

### What is it?
Provides raw virtual computing infrastructure—virtual machines, storage, and networking—over the internet.

### Why is it used?
- Gives full root/admin control over the operating system, network configuration, and installed software.
- Best for migrating legacy monolithic applications to the cloud.

### How is it used?
You launch a VM, choose Ubuntu Linux, install Java and MySQL via SSH, and configure security firewalls.

### Real-Life Example
**Renting an Unfurnished Apartment:** You get empty rooms and walls; you bring your own furniture, appliances, and set up your Wi-Fi.

### Cloud Example
- **AWS:** Amazon EC2, Amazon EBS, Amazon VPC
- **Azure:** Azure Virtual Machines
- **GCP:** Google Compute Engine

---

### 3.2 PaaS (Platform as a Service)

### What is it?
Provides a pre-configured platform and runtime environment where developers can build, deploy, and manage applications without managing servers or operating systems.

### Why is it used?
- Speeds up development; developers focus 100% on writing code instead of configuring OS patches and servers.

### How is it used?
You write your Java/Python code locally, upload the code file/git repo, and the platform automatically handles server setup, scaling, and load balancing.

### Real-Life Example
**Fully Equipped Commercial Kitchen:** The stove, chimney, and refrigerator are provided; you just bring your recipe and cook.

### Cloud Example
- **AWS:** AWS Elastic Beanstalk, AWS Lambda
- **Azure:** Azure App Service
- **GCP:** Google App Engine, Cloud Run

---

### 3.3 SaaS (Software as a Service)

### What is it?
Complete, ready-to-use software applications delivered over the web and managed entirely by the vendor.

### Why is it used?
- Zero installation, zero hardware setup, zero maintenance, accessible from any browser on any device.

### How is it used?
Users open a web browser, log in with an email/password, and start using the software.

### Real-Life Example
**Dining at a Restaurant:** You don't cook, buy ingredients, or clean dishes; you order food, eat, and pay the bill.

### Cloud Example
Gmail, Google Docs, Microsoft 365, Salesforce, Dropbox, Zoom.

---

### Quick Comparison Table
| Feature | IaaS | PaaS | SaaS |
|---|---|---|---|
| **What is Provided** | Raw VMs, Storage, Network | Ready Runtime & Platform | Finished Software |
| **You Manage** | OS, Runtime, App, Data | Application Code & Data | User Settings |
| **Provider Manages** | Hardware & Virtualization | Hardware, OS & Runtime | Entire Application Stack |
| **Best For** | SysAdmins & DevOps | Software Developers | End Users |
| **Top Example** | AWS EC2 | Azure App Service | Gmail / Microsoft 365 |

---

## 4. AWS vs. Azure vs. GCP Overview

### What is it?
The three dominant public cloud hyperscalers that provide global infrastructure and on-demand cloud services.

### Why are they used?
- **AWS:** Market leader with the broadest service catalog and largest ecosystem.
- **Azure:** Best enterprise integration for companies using Microsoft Windows, Active Directory, and .NET.
- **GCP:** Industry leader in Big Data analytics, AI/ML tools, and Kubernetes.

### Core Service Mapping Table
| Category | AWS | Azure | GCP |
|---|---|---|---|
| **Virtual Server** | Amazon EC2 | Azure Virtual Machines | Google Compute Engine |
| **Object Storage** | Amazon S3 | Azure Blob Storage | Google Cloud Storage |
| **Relational Database** | Amazon RDS | Azure SQL Database | Google Cloud SQL |
| **Serverless Functions** | AWS Lambda | Azure Functions | Google Cloud Functions |
| **Kubernetes Engine** | Amazon EKS | Azure AKS | Google GKE |
| **Virtual Network** | Amazon VPC | Azure VNet | Google VPC |

---

## 5. Cloud Pricing Models

### What is it?
The flexible cost structures used by cloud providers to charge customers based on resource usage.

### Pricing Types:
1. **On-Demand (Pay-As-You-Go):** Pay per second/hour with zero commitment. Highest flexibility, standard rates. (*Best for new/unpredictable apps*).
2. **Reserved / Savings Plans:** Commit for 1 or 3 years in exchange for up to **72% discount**. (*Best for steady 24/7 production databases*).
3. **Spot Instances:** Bid on unused spare cloud capacity with up to **90% discount**. Can be interrupted with short notice. (*Best for batch jobs & background tasks*).
4. **Free Tier:** Free monthly quotas to learn and experiment without charges.

### Real-Life Example
- **On-Demand:** Booking an Uber or standard flight ticket at regular price.
- **Reserved:** Buying an annual train/metro pass at a huge discount.
- **Spot:** Buying a "standby" flight ticket at 90% discount that can be cancelled if full-fare passengers arrive.

---

## 6. CapEx vs. OpEx

### What is it?
- **CapEx (Capital Expenditure):** Money spent upfront to purchase physical assets (servers, data centers).
- **OpEx (Operational Expenditure):** Ongoing day-to-day expenses for running services (monthly cloud bill).

### Why is it important?
Cloud shifts IT spending from **CapEx to OpEx**, allowing startups and businesses to launch products with zero upfront investment.

| Feature | CapEx | OpEx |
|---|---|---|
| **Payment Timing** | Large upfront payment | Monthly pay-per-use |
| **Asset Ownership** | You own the hardware | Cloud provider owns hardware |
| **IT Model** | Traditional On-Premises | Cloud Computing |

---

## 7. Scalability vs. Elasticity

### Scalability (Ability to Grow)
- **What is it:** The capacity of a system to handle increasing workload by adding resources.
- **Example:** Upgrading from 2 servers to 10 servers over a year as your customer base expands.

### Elasticity (Automatic Scaling)
- **What is it:** The ability of a system to **automatically** add resources during traffic spikes and remove them when traffic drops.
- **Example:** An e-commerce website automatically scaling from 2 servers to 20 servers during a 3-hour flash sale, and automatically shrinking back to 2 servers afterward.

---

## 8. Vertical Scaling vs. Horizontal Scaling

### Vertical Scaling (Scale Up)
- **What is it:** Increasing the power/capacity of an existing single machine (e.g., adding more RAM or CPU).
- **Limitation:** Has a hardware ceiling and creates a single point of failure.

### Horizontal Scaling (Scale Out)
- **What is it:** Adding more independent machines to distribute workload across multiple servers.
- **Advantage:** Highly scalable, supports auto-scaling, and provides high availability.

```text
Vertical Scaling (Scale Up):    [ 4GB RAM ]   ───>   [ 32GB RAM ]
Horizontal Scaling (Scale Out): [ Server 1 ]  ───>   [ Server 1 ] + [ Server 2 ] + [ Server 3 ]
```

---

## 9. Day 1 Quick Interview Revision (One-Liners)

- **Cloud Computing:** On-demand delivery of computing resources over the internet with pay-as-you-go pricing.
- **Public Cloud:** Multi-tenant infrastructure shared by multiple customers (AWS, Azure, GCP).
- **Private Cloud:** Single-tenant infrastructure dedicated to one company.
- **Hybrid Cloud:** Connected combination of Private and Public cloud environments.
- **IaaS:** You manage OS, runtime, and app; provider manages hardware (*AWS EC2*).
- **PaaS:** Provider manages OS and runtime; you only deploy code (*Azure App Service*).
- **SaaS:** Provider manages the complete application; you just use it (*Gmail*).
- **CapEx vs OpEx:** CapEx is upfront hardware purchase; OpEx is ongoing pay-as-you-use billing.
- **Scalability:** Capacity to grow.
- **Elasticity:** Automatic dynamic growing and shrinking based on real-time demand.
- **Vertical vs Horizontal:** Vertical is a bigger machine (Scale Up); Horizontal is more machines (Scale Out).
