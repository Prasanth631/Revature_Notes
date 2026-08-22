# Day 2 — Cloud Fundamentals

## 1. Components of Cloud Computing

A cloud environment consists of several important components.

The major ones you should know are:

1. Compute
2. Storage
3. Networking
4. Database
5. Security
6. Management & Monitoring

Let's understand each one.

---

# 1.1 Compute

### Definition

**Compute refers to the processing power used to run applications and perform calculations.**

In simple terms:

> Compute = Where your application runs.

Examples:

* Virtual Machines
* Containers
* Serverless functions

### AWS

* EC2
* Lambda
* ECS/EKS

### Azure

* Azure Virtual Machines
* Azure Functions
* Azure Kubernetes Service

### GCP

* Compute Engine
* Cloud Functions
* Google Kubernetes Engine

### Real-life example

Suppose you build a Java application.

The application needs CPU and memory to execute.

```text
Java Application
       ↓
Compute Resource
       ↓
CPU + RAM
```

Without compute resources, your application cannot execute.

---

# 1.2 Storage

### Definition

**Cloud storage provides a place to store data such as files, images, videos, backups and documents.**

Examples:

* Images
* Videos
* PDFs
* Application files
* Backups

### AWS

**Amazon S3**

### Azure

**Azure Blob Storage**

### GCP

**Cloud Storage**

### Real-life example

Suppose you build Instagram.

Users upload:

```text
Photos
Videos
Profile pictures
```

These files can be stored in cloud object storage.

```text
User
 ↓
Upload Photo
 ↓
Cloud Storage
```

---

# 1.3 Networking

### Definition

**Networking connects different cloud resources and allows users and applications to communicate with them.**

Networking includes concepts such as:

* IP addresses
* Virtual networks
* Subnets
* Routing
* Firewalls
* Load balancers

### Example

Suppose you have:

```text
User
 ↓
Internet
 ↓
Web Server
 ↓
Application Server
 ↓
Database
```

Networking allows these components to communicate.

### AWS

**VPC — Virtual Private Cloud**

### Azure

**Virtual Network (VNet)**

### GCP

**VPC**

---

# 1.4 Database

### Definition

A database is used to store and manage structured application data.

For example, an e-commerce application might store:

```text
Customer
Product
Order
Payment
```

### Examples

AWS:

* RDS
* DynamoDB

Azure:

* Azure SQL Database
* Cosmos DB

GCP:

* Cloud SQL
* Firestore

### Real-life example

When you order a product online:

```text
Customer
   ↓
Order
   ↓
Database
```

The database stores information about the order.

---

# 1.5 Security

Security protects:

* Applications
* Data
* Users
* Infrastructure

Important security concepts include:

* Authentication
* Authorization
* Encryption
* Firewalls
* Identity and access management
* Network security

### Authentication

**Who are you?**

Example:

```text
Username + Password
```

### Authorization

**What are you allowed to do?**

Example:

```text
Normal User → View products

Admin → Add/delete products
```

### Easy interview difference

> Authentication verifies identity, while authorization determines what an authenticated user is allowed to access.

---

# 1.6 Management and Monitoring

Cloud environments need to be monitored.

You want to know:

* Is the application running?
* How much CPU is being used?
* Is memory increasing?
* Are servers failing?
* Are users receiving errors?
* How much are we spending?

Examples:

AWS:

**CloudWatch**

Azure:

**Azure Monitor**

GCP:

**Cloud Monitoring**

---

# 2. Cloud Architecture

Now let's understand how these components work together.

A basic cloud architecture looks like this:

```text
                    USERS
                      |
                      ↓
                  INTERNET
                      |
                      ↓
               LOAD BALANCER
                      |
             -------------------
             |                 |
             ↓                 ↓
         SERVER 1           SERVER 2
             |                 |
             ----------- -------
                       |
                       ↓
                  APPLICATION
                       |
                 --------------
                 |            |
                 ↓            ↓
             DATABASE      STORAGE
```

Let's understand each layer.

---

# 3. Three-Tier Architecture

This is extremely important for interviews.

A common application architecture is:

```text
Presentation Layer
        ↓
Application Layer
        ↓
Data Layer
```

---

## 3.1 Presentation Layer

This is the **user interface**.

Examples:

* Website
* Mobile application
* Web browser interface

For example:

```text
Chrome
   ↓
Amazon website
```

The user interacts with the presentation layer.

---

# 3.2 Application Layer

This contains the **business logic**.

For example:

A user clicks:

> "Buy Now"

The application layer processes:

```text
Check product
       ↓
Check inventory
       ↓
Calculate price
       ↓
Create order
```

This could be implemented using:

* Java
* Python
* Node.js
* .NET

---

# 3.3 Data Layer

This layer stores application data.

Examples:

* MySQL
* PostgreSQL
* SQL Server
* MongoDB
* Cloud databases

Example:

```text
Application
    ↓
Database
    ↓
Customer information
Orders
Products
Payments
```

---

# 4. Complete Three-Tier Cloud Example

Imagine an online shopping website.

```text
                USER
                  |
                  ↓
           Presentation
            Web / Mobile
                  |
                  ↓
            Load Balancer
                  |
          -----------------
          |               |
          ↓               ↓
      App Server 1    App Server 2
          |               |
          -------- --------
                  |
                  ↓
             Database
                  |
                  ↓
             Cloud Storage
```

### Example

User uploads a product image.

```text
User
 ↓
Web Application
 ↓
Application Server
 ↓
Cloud Storage
```

User places an order:

```text
User
 ↓
Application
 ↓
Database
 ↓
Order stored
```

---

# 5. Benefits of Cloud Computing

You should definitely know these for interviews.

## 5.1 Cost Savings

You don't have to purchase large amounts of physical infrastructure upfront.

Instead:

> Pay for the resources you use.

---

## 5.2 Scalability

You can increase resources when your workload increases.

Example:

```text
Normal traffic
     ↓
2 servers

High traffic
     ↓
10 servers
```

---

## 5.3 Elasticity

Resources can increase or decrease based on demand.

```text
Traffic ↑
   ↓
Resources ↑

Traffic ↓
   ↓
Resources ↓
```

---

## 5.4 High Availability

Cloud architectures can use redundant resources to keep applications available.

Example:

```text
              Application
                 |
          Load Balancer
           /          \
          ↓            ↓
      Server 1      Server 2
```

If Server 1 fails, traffic can be directed to Server 2.

---

## 5.5 Global Reach

Cloud providers have infrastructure in different geographic locations.

This allows companies to deploy applications closer to users.

Example:

```text
India Users
     ↓
India/nearby region

US Users
     ↓
US region
```

This can reduce latency.

---

## 5.6 Faster Deployment

Instead of purchasing and configuring physical servers, cloud resources can often be provisioned quickly.

For example:

```text
Traditional:
Purchase → Delivery → Installation → Configuration

Cloud:
Provision → Configure → Deploy
```

---

## 5.7 Backup and Disaster Recovery

Cloud services can be used for:

* Data backup
* Replication
* Disaster recovery

Example:

```text
Primary Database
       ↓
Backup / Replica
       ↓
Different location
```

If the primary system fails, recovery can be performed using the backup/recovery architecture.

---

# 6. Challenges of Cloud Computing

Don't say cloud has only benefits.

Interviewers may ask:

> "What are the challenges of cloud computing?"

Important challenges include:

1. Security
2. Cost management
3. Vendor lock-in
4. Internet dependency
5. Downtime
6. Compliance
7. Migration complexity

---

## 6.1 Security

Your data is hosted in cloud infrastructure, so proper security configuration is essential.

Common issues can include:

* Incorrect permissions
* Exposed storage
* Weak authentication
* Misconfigured network rules

### Example

Suppose an organization accidentally makes a storage bucket publicly accessible.

Sensitive files could potentially be exposed.

Therefore:

> Cloud security is a **shared responsibility** between the cloud provider and the customer.

This is an important interview topic.

---

# 6.2 Cost Management

Cloud can become expensive if resources aren't managed properly.

Example:

```text
Developer creates VM
       ↓
Forgets to stop/delete it
       ↓
VM continues running
       ↓
Charges continue
```

Therefore organizations use:

* Budgets
* Alerts
* Cost monitoring
* Resource optimization

---

# 6.3 Vendor Lock-in

### Definition

Vendor lock-in occurs when an organization becomes heavily dependent on one cloud provider's services, making migration to another provider difficult or expensive.

Example:

```text
Company
   ↓
Uses many proprietary AWS services
   ↓
Wants to move to Azure
   ↓
Migration becomes difficult
```

---

# 6.4 Internet Dependency

Cloud services are generally accessed over networks.

If connectivity is poor:

```text
User
 ↓
Internet ❌
 ↓
Cloud application
```

The user may not be able to access the application.

---

# 6.5 Downtime

Cloud providers design for high availability, but no system can guarantee that every service will always be available.

Organizations therefore use:

* Redundancy
* Multiple availability zones
* Failover
* Backup
* Disaster recovery

---

# 6.6 Compliance

Organizations in industries such as:

* Banking
* Healthcare
* Government

may have rules regarding:

* Where data can be stored
* Who can access it
* How long data should be retained
* How data must be protected

---

# 7. Types of Data

This is one of your important Day 2 topics.

There are three major categories:

```text
Structured
Semi-structured
Unstructured
```

---

# 8. Structured Data

### Definition

**Structured data is data organized according to a predefined schema, usually in rows and columns.**

The easiest example is a relational database.

Example:

|  ID | Name  | Age | City      |
| --: | ----- | --: | --------- |
| 101 | Ravi  |  22 | Chennai   |
| 102 | Priya |  23 | Hyderabad |
| 103 | Arun  |  21 | Bangalore |

Every record follows the same structure.

```text
ID | Name | Age | City
```

### Examples

* MySQL tables
* PostgreSQL tables
* SQL Server tables
* Excel spreadsheets
* CSV files

### Real-life example

A college student database:

```text
Student_ID
Name
Age
Department
CGPA
```

Every student follows the same structure.

### Key characteristic

> Structured data has a predefined schema.

---

# 9. Semi-Structured Data

### Definition

**Semi-structured data does not follow a strict tabular structure but contains tags, keys, metadata, or other markers that provide organization.**

Common examples:

* JSON
* XML
* YAML

---

## JSON Example

```json
{
  "id": 101,
  "name": "Prasanth",
  "skills": [
    "Java",
    "SQL",
    "Python"
  ]
}
```

Notice that this isn't a traditional table.

But it still has structure:

```text
id → 101
name → Prasanth
skills → Java, SQL, Python
```

Therefore it's called **semi-structured**.

---

## XML Example

```xml
<student>
    <id>101</id>
    <name>Prasanth</name>
    <department>CSE</department>
</student>
```

It has tags that describe the data.

### Key characteristic

> Semi-structured data has some organizational structure but does not require a rigid relational schema.

---

# 10. Unstructured Data

### Definition

**Unstructured data does not follow a predefined data model or organized tabular structure.**

Examples:

* Images
* Videos
* Audio
* PDFs
* Text documents
* Social media posts
* Emails

### Example

A photograph:

```text
📷 image.jpg
```

It doesn't have columns like:

```text
ID | Name | Age | City
```

Instead, it contains image data.

---

# 11. Structured vs Semi-Structured vs Unstructured

This is a **very important interview comparison**.

| Feature      | Structured    | Semi-Structured          | Unstructured         |
| ------------ | ------------- | ------------------------ | -------------------- |
| Schema       | Predefined    | Flexible                 | No predefined schema |
| Organization | High          | Moderate                 | Low                  |
| Examples     | SQL table     | JSON/XML                 | Image/video/PDF      |
| Storage      | Relational DB | NoSQL/document DB, files | Object storage/files |
| Querying     | Easy with SQL | Depends on format/tool   | More complex         |
| Flexibility  | Low           | High                     | Very high            |

### Easy memory trick

```text
Structured
↓
Table

Semi-structured
↓
JSON/XML

Unstructured
↓
Image/Video/Audio/PDF
```

---

# 12. File Types

Now let's understand common file types you will encounter in cloud/data environments.

## CSV

**CSV = Comma-Separated Values**

Example:

```text
id,name,age
101,Prasanth,22
102,Ravi,23
103,Arun,21
```

### Characteristics

* Simple
* Lightweight
* Human-readable
* Tabular
* Common in data exchange

CSV generally represents **structured data**.

---

# 13. JSON

**JSON = JavaScript Object Notation**

Example:

```json
{
  "id": 101,
  "name": "Prasanth",
  "age": 22
}
```

Commonly used for:

* APIs
* Web applications
* Configuration
* Data exchange

JSON is **semi-structured**.

---

# 14. XML

**XML = Extensible Markup Language**

Example:

```xml
<student>
    <id>101</id>
    <name>Prasanth</name>
    <age>22</age>
</student>
```

It uses tags to describe data.

XML is also **semi-structured**.

---

# 15. TXT

A plain text file.

Example:

```text
Cloud computing is the delivery
of computing resources over the internet.
```

Depending on its content and organization, plain text is generally treated as **unstructured data**.

---

# 16. PDF

PDF is commonly used for:

* Documents
* Reports
* Invoices
* Certificates
* Manuals

Example:

```text
student_certificate.pdf
invoice.pdf
report.pdf
```

PDFs are generally treated as **unstructured data** from a data-processing perspective, although a PDF can internally contain structured elements.

---

# 17. Image Files

Examples:

```text
.jpg
.jpeg
.png
.gif
.webp
```

Example:

```text
profile.jpg
product.png
```

These are generally **unstructured data**.

---

# 18. Audio Files

Examples:

```text
.mp3
.wav
.aac
```

These are generally unstructured data.

---

# 19. Video Files

Examples:

```text
.mp4
.mkv
.avi
.mov
```

These are also generally unstructured data.

---

# 20. Important File Types for Cloud/Data Engineering

Since your Revature training may later move toward data engineering, pay special attention to these:

### CSV

Simple tabular data.

### JSON

Common for APIs.

### XML

Common in enterprise systems and older integrations.

### Parquet

**Columnar storage format** commonly used in big-data and analytics systems.

### Avro

A row-oriented serialization format often used in data pipelines and distributed systems.

### ORC

Another columnar storage format commonly used in big-data ecosystems.

You don't need to master Parquet, Avro and ORC yet if they aren't in your current syllabus, but recognize their names.

---

# 21. CSV vs JSON

Interviewers may ask this.

### CSV

```text
id,name,age
101,Prasanth,22
102,Ravi,23
```

Best suited for simple tabular data.

### JSON

```json
{
  "id": 101,
  "name": "Prasanth",
  "age": 22
}
```

Better suited for hierarchical/nested data.

For example:

```json
{
  "student": {
    "name": "Prasanth",
    "skills": [
      "Java",
      "Python",
      "SQL"
    ]
  }
}
```

CSV is not naturally suited to this kind of nested structure.

---

# 22. Real-Life Example: E-Commerce Company

Let's put all Day 2 concepts together.

Suppose you're working for an e-commerce company.

### Compute

Runs the application.

```text
Application
     ↓
Cloud VM
```

### Storage

Stores product images.

```text
Product Image
     ↓
Cloud Object Storage
```

### Database

Stores structured information.

```text
Customer
Product
Order
Payment
```

### Networking

Connects users, application servers and databases.

```text
User
 ↓
Internet
 ↓
Load Balancer
 ↓
Application
 ↓
Database
```

### Security

Controls who can access the system.

### Monitoring

Tracks:

```text
CPU
Memory
Errors
Traffic
Cost
```

### Data types

The company may have:

```text
Structured:
Customer table

Semi-structured:
JSON API response

Unstructured:
Product images/videos/PDF invoices
```

---

# 23. Very Important Concept: Shared Responsibility

This is likely to come up in cloud interviews.

Cloud security is not completely the provider's responsibility.

It is **shared**.

Think:

```text
Cloud Provider
       |
       ↓
Security OF the Cloud

Customer
       |
       ↓
Security IN the Cloud
```

For example, the provider is responsible for the physical data center and underlying infrastructure, while customers are responsible for configuring their workloads and access appropriately.

The exact responsibilities depend on the service model.

---

# 24. Day 2 Interview Questions

Make sure you can answer these:

### Components

1. What are the major components of cloud computing?
2. What is compute?
3. What is cloud storage?
4. What is cloud networking?
5. What is a cloud database?
6. What is cloud monitoring?
7. What is IAM/security?

### Architecture

8. What is cloud architecture?
9. What is three-tier architecture?
10. What is the presentation layer?
11. What is the application layer?
12. What is the data layer?
13. Why is a load balancer used?
14. What happens if one application server fails?

### Benefits

15. What are the benefits of cloud computing?
16. What is scalability?
17. What is elasticity?
18. What is high availability?
19. How does cloud reduce infrastructure cost?
20. How does cloud help disaster recovery?

### Challenges

21. What are the challenges of cloud computing?
22. What is vendor lock-in?
23. What is cloud security?
24. Why is cost management important?
25. What is compliance?
26. What is shared responsibility?

### Data

27. What is structured data?
28. What is semi-structured data?
29. What is unstructured data?
30. Give examples of each.
31. Is JSON structured or semi-structured?
32. Is CSV structured or unstructured?
33. Is an image structured or unstructured?
34. What is JSON?
35. What is XML?
36. What is CSV?
37. What is Parquet?
38. Difference between CSV and JSON?

---

# 25. Interview Rapid-Fire Revision

If you have only **5 minutes before the interview**, remember this:

### Cloud Components

```text
Compute
Storage
Networking
Database
Security
Monitoring
```

### Architecture

```text
User
 ↓
Internet
 ↓
Load Balancer
 ↓
Application Servers
 ↓
Database / Storage
```

### Three-Tier

```text
Presentation
      ↓
Application
      ↓
Data
```

### Benefits

```text
Cost reduction
Scalability
Elasticity
High availability
Global reach
Fast deployment
Backup/DR
```

### Challenges

```text
Security
Cost management
Vendor lock-in
Internet dependency
Downtime
Compliance
Migration complexity
```

### Data Types

```text
Structured
    ↓
SQL table / CSV

Semi-structured
    ↓
JSON / XML

Unstructured
    ↓
Image / Video / Audio / PDF
```

### File Types

```text
CSV    → Tabular
JSON   → Key-value / nested
XML    → Tags
TXT    → Plain text
PDF    → Document
JPG/PNG → Image
MP3    → Audio
MP4    → Video
Parquet → Columnar analytics format
Avro   → Data serialization format
ORC    → Columnar analytics format
```

## ⭐ Most important concepts from Day 1 + Day 2

You should now be able to explain this complete flow:

> **A cloud provider offers compute, storage, networking, databases and security services. Applications can be designed using architectures such as three-tier architecture. Cloud provides benefits such as scalability, elasticity, high availability and reduced upfront infrastructure cost, but it also introduces challenges such as security, cost management, vendor lock-in and compliance. The data processed by cloud applications can be structured, semi-structured or unstructured and can exist in formats such as CSV, JSON, XML, PDF, images, Parquet and Avro.**

That paragraph is a good **mental map** connecting Day 1 and Day 2 rather than treating every topic as an isolated definition.
