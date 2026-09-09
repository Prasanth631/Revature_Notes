# Day 7: dbt Advanced, Task Orchestration & Snowflake Security Governance

![Snowflake](https://img.shields.io/badge/Snowflake_Advanced_%26_Security-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Advanced dbt](https://img.shields.io/badge/dbt_Advanced_%26_SCD_Snapshots-FF694B?style=for-the-badge&logo=dbt&logoColor=white)

## 1. Advanced dbt & Snowflake Integration (Snapshots & Incremental Models)

### Definition
Advanced dbt patterns with Snowflake leverage incremental merge strategies and dbt Snapshots to automatically capture Slowly Changing Dimensions (SCD Type 2), tracking historical state mutations over time using `valid_from` and `valid_to` timestamps without manual complex SQL logic.

### Why it matters / Real-world use case
A retail customer changes their shipping address from New York to Austin. Rather than overwriting the record (losing historical reporting context for past New York sales), a dbt Snapshot expires the New York record by updating `dbt_valid_to` and inserts a new active row for Austin with `dbt_valid_to = NULL`.

### How it works
- **SCD Type 2 Snapshots:** dbt monitors source tables using either a `timestamp` strategy (comparing updated-at columns) or a `check` strategy (hashing designated columns) to identify row modifications.
- **Incremental Merge Strategy:** Uses Snowflake's native `MERGE INTO` under the hood to perform upserts into target tables based on `unique_key`.
- **Hooks & Pre/Post Execution:** Executes custom Snowflake DDL/DML before or after models run (e.g., granting privileges, running vacuum commands).

```text
Incoming Customer Mutation:
  Customer 101 changes address: 'New York' -> 'Austin'
                          |
                          v  dbt snapshot
[Snapshot Target Table: dim_customers_snapshot]
Row 1: ID: 101 | City: 'New York' | valid_from: '2025-01-01' | valid_to: '2026-03-01' (Closed)
Row 2: ID: 101 | City: 'Austin'   | valid_from: '2026-03-01' | valid_to: NULL         (Current Active)
```

### Example

```sql
-- snapshots/snap_customers.sql
{% snapshot snap_customers %}

{{
    config(
      target_database='retail_dw',
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='timestamp',
      updated_at='last_modified_ts'
    )
}}

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    city,
    last_modified_ts
FROM {{ source('pos_landing', 'dim_customers') }}

{% endsnapshot %}
```

### Interview Q&A

**Q1: What is a dbt Snapshot and what problem does it solve?**
**Answer:** A dbt Snapshot is a mechanism to implement Slowly Changing Dimensions (SCD Type 2) over mutable source tables. It tracks point-in-time state changes by adding historical tracking columns (`dbt_valid_from`, `dbt_valid_to`, `dbt_scd_id`), eliminating manual MERGE statement maintenance.

**Q2: What are the two strategies available for dbt Snapshots?**
**Answer:** The `timestamp` strategy (which relies on a reliable `updated_at` column in the source table to detect changes) and the `check` strategy (which compares a list of columns or calculates a hash to detect mutations when no timestamp exists).

**Q3: How do you optimize warehouse costs when running dbt in Snowflake?**
**Answer:** Use `incremental` materializations to process delta changes, configure dedicated single-cluster warehouses for dbt with short `AUTO_SUSPEND` (60 seconds), run dbt tests concurrently, and leverage `dbt-snowflake` native merge strategies.

### Common Pitfalls / Gotchas
- Modifying or dropping snapshot target columns manually in Snowflake; manual schema drift breaks dbt snapshot reconciliation logic.
- Using the `check` strategy on volatile columns (e.g., millisecond last-login timestamps) that change on every query, generating millions of spurious SCD records.
- Running full table refreshes (`dbt run --full-refresh`) in production inadvertently, destroying incremental history.

### Quick Recap
- dbt Snapshots automate SCD Type 2 historical change tracking.
- Strategies: `timestamp` (preferred) or `check` (column hash).
- Appends `dbt_valid_from` and `dbt_valid_to` columns automatically.
- Incremental models compile to native Snowflake `MERGE INTO` operations.
- Always use dedicated warehouses with 60s auto-suspend for dbt transformation runs.

---

![Task Orchestration](https://img.shields.io/badge/Task_Orchestration-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. Task Orchestration with Stored Procedures

### Definition
Snowflake Tasks are native, scheduled execution units that run single SQL statements, Stored Procedures, or procedural workflows on a defined schedule (CRON or intervals). Tasks can be chained together into complex Directed Acyclic Graphs (DAGs) using the `AFTER` clause.

### Why it matters / Real-world use case
An organization wants to run an hourly pipeline: Task 1 calls an ingestion procedure, Task 2 runs data validation tests, and Task 3 refreshes a reporting table. Instead of paying for and hosting an external Airflow cluster, data engineers orchestrate the entire end-to-end dependency pipeline natively inside Snowflake using Tasks.

### How it works
- **Serverless Tasks vs User-Managed Tasks:**
  - **Serverless Tasks:** Automatically managed and scaled by Snowflake compute; billed per second on serverless compute.
  - **User-Managed Tasks:** Runs on a specified Virtual Warehouse; warehouse must be running or auto-resume.
- **Task Graphs (DAGs):** A Root Task triggers on a schedule; dependent child tasks execute upon successful completion of predecessor tasks (`AFTER predecessor_task`).
- **State Control:** Tasks are created in a `SUSPENDED` state by default and must be explicitly resumed (`ALTER TASK ... RESUME`).

```text
[Root Task: Ingestion (Runs every hour via CRON)]
                     |
                     v (AFTER)
        [Child Task 1: Validation]
                     |
                     v (AFTER)
        [Child Task 2: Aggregation Marts]
```

### Example

```sql
-- 1. Create Root Task scheduled using standard CRON
CREATE OR REPLACE TASK retail_dw.raw_pos.task_hourly_ingestion
    WAREHOUSE = INGEST_WH
    SCHEDULE = 'USING CRON 0 * * * * America/New_York'
AS
    CALL retail_dw.raw_pos.ingest_pos_files();

-- 2. Create Child Task dependent on Root Task completion
CREATE OR REPLACE TASK retail_dw.raw_pos.task_refresh_metrics
    WAREHOUSE = INGEST_WH
    AFTER retail_dw.raw_pos.task_hourly_ingestion
AS
    INSERT INTO retail_dw.raw_pos.hourly_summary
    SELECT CURRENT_TIMESTAMP(), COUNT(*), SUM(order_amount)
    FROM retail_dw.raw_pos.customer_orders;

-- 3. Enable task tree (Children must be resumed BEFORE Root Task!)
ALTER TASK retail_dw.raw_pos.task_refresh_metrics RESUME;
ALTER TASK retail_dw.raw_pos.task_hourly_ingestion RESUME;
```

### Interview Q&A

**Q1: What is the rule regarding the order of resuming tasks in a DAG?**
**Answer:** Child tasks must be resumed **first** before resuming the root task. If the root task is resumed while child tasks are suspended, only the root task executes, and the downstream DAG fails to trigger.

**Q2: What is a Serverless Task in Snowflake?**
**Answer:** A Serverless Task does not require specifying a Virtual Warehouse (`WAREHOUSE` parameter is omitted). Snowflake dynamically provisions and manages the compute resources on demand, billing compute on a per-second serverless metering model.

**Q3: How do you prevent overlapping task runs if a task takes longer than its schedule?**
**Answer:** Snowflake automatically prevents task overlap. If a scheduled task is still running when its next execution time arrives, Snowflake skips that scheduled run entirely to avoid concurrent pipeline collisions.

### Common Pitfalls / Gotchas
- Forgetting that tasks are created in a `SUSPENDED` state by default; failing to call `ALTER TASK ... RESUME` leaves the pipeline dormant.
- Modifying a task while it is active; tasks must be suspended before altering their SQL definition or schedule.
- Resuming the root task before resuming its child tasks, preventing downstream graph execution.

### Quick Recap
- Native workflow orchestrator running SQL or Stored Procedures.
- Schedules: CRON syntax (`USING CRON`) or interval minutes.
- Dependency chains (DAGs) configured using `AFTER task_name`.
- Choose between User-Managed Warehouses or Serverless Task compute.
- Always resume child tasks first, then resume the root task.

---

![Python Connector](https://img.shields.io/badge/Python_Connector_%26_Auth-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Python Connector Hands-On & Authentication Methods

### Definition
The Snowflake Connector for Python (`snowflake-connector-python`) is a high-performance native library enabling Python applications to execute queries and manage data pipelines. Secure authentication is enforced using Key-Pair Authentication (cryptographic RSA keys for automated service accounts) or OAuth (delegated token access for interactive applications).

### Why it matters / Real-world use case
An automated Airflow orchestration worker runs in a secure Kubernetes cluster. Using standard passwords requires storing plain-text secrets and risks credential compromise. The enterprise configures 2048-bit RSA Key-Pair Authentication, allowing the service account to connect securely without passwords or multi-factor authentication (MFA) prompts.

### How it works
- **Authentication Hierarchy:**
  - **Key-Pair (Service Accounts):** Public key assigned to the Snowflake user (`ALTER USER ... SET RSA_PUBLIC_KEY`); client signs JWT tokens using the private key file.
  - **OAuth (Web Apps / BI):** Uses identity providers (Okta, Azure AD) to issue short-lived bearer tokens without exposing credentials to client applications.
  - **User/Password + SSO:** Standard interactive authentication.
- **REST API / SQL API:** Snowflake provides a serverless RESTful SQL API to execute queries over standard HTTPS POST requests without maintaining persistent database socket connections.

```text
[Python Client / Airflow Service]
       |
  1. Signs JWT with Private Key (Encrypted RSA 2048)
       |
       v
[Snowflake Cloud Services: Authenticates via Public Key]
       |
  2. Verifies Signature & Executes Query Session
```

### Example

```python
# Python script using snowflake-connector-python with Key-Pair Authentication
import snowflake.connector
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

# 1. Load encrypted RSA Private Key
with open("/secrets/snowflake_rsa_key.p8", "rb") as key_file:
    p_key = serialization.load_pem_private_key(
        key_file.read(),
        password=b"KeyPassphrase123",
        backend=default_backend()
    )
pkb = p_key.private_bytes(
    encoding=serialization.Encoding.DER,
    format=serialization.PrivateFormat.PKCS8,
    encryption_algorithm=serialization.NoEncryption()
)

# 2. Establish connection
conn = snowflake.connector.connect(
    user="SVC_ETL_PIPELINE",
    account="xy12345.us-east-1",
    private_key=pkb,
    warehouse="INGEST_WH",
    database="RETAIL_DW",
    schema="RAW_POS"
)

# 3. Execute query and fetch results
cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM customer_orders")
row_count = cursor.fetchone()[0]
print(f"Current Order Count: {row_count}")
conn.close()
```

### Interview Q&A

**Q1: Why is Key-Pair Authentication recommended for automated service accounts in Snowflake?**
**Answer:** It eliminates plain-text password storage in code or config files, supports automated non-interactive rotation of cryptographic RSA keys, and bypasses Multi-Factor Authentication (MFA) requirements that block automated service jobs.

**Q2: What is the Snowflake SQL REST API and when should you use it?**
**Answer:** The Snowflake SQL API is a RESTful API that allows developers to submit SQL queries and retrieve results using standard HTTPS requests. It is ideal for lightweight, serverless microservices (e.g., AWS Lambda, Azure Functions) that do not require stateful driver connections.

**Q3: How do you register a public key to a Snowflake user?**
**Answer:** Convert the public key to PKCS#8 format and execute `ALTER USER svc_user SET RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BA...';`.

### Common Pitfalls / Gotchas
- Storing unencrypted private keys in Git repositories; private keys should be protected with a passphrase and stored in secret managers (e.g., HashiCorp Vault, AWS Secrets Manager).
- Using basic password authentication for automated service accounts where organizational MFA policies frequently break unattended pipelines.
- Forgetting to close cursor and connection objects in Python, causing connection pool leaks.

### Quick Recap
- `snowflake-connector-python` enables native Python data operations.
- Key-Pair Authentication uses RSA 2048-bit keys for secure headless service accounts.
- OAuth enables token-based authentication via Okta or Azure AD for web tools.
- SQL API provides serverless HTTPS endpoints for lightweight microservices.
- Always store private keys in encrypted vaults.

---

![RBAC Governance](https://img.shields.io/badge/RBAC_%26_Access_Control-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 4. Roles, Privileges & Role-Based Access Control (RBAC)

### Definition
Role-Based Access Control (RBAC) is Snowflake's security framework where privileges are granted to **Roles**, and roles are granted to **Users** and other roles. Privileges are never assigned directly to individual user accounts.

### Why it matters / Real-world use case
An enterprise hires 50 contractors for a marketing analytics project. Rather than manually granting 50 users individual permissions to 30 tables, the data architect creates a role `MARKETING_ANALYST`, assigns table `SELECT` grants to that role, and assigns the role to the 50 users. Revoking access requires updating only the single role.

### How it works
- **System-Defined Roles:**
  - `ACCOUNTADMIN`: Supreme role; encapsulates `SYSADMIN` and `SECURITYADMIN`. Reserved for billing and account config.
  - `SECURITYADMIN`: Manages grants globally; inherits `USERADMIN`.
  - `USERADMIN`: Creates and manages users and roles.
  - `SYSADMIN`: Creates and owns database objects and warehouses.
  - `PUBLIC`: Default pseudo-role granted to every user automatically.
- **Custom Functional Roles:** Created to match business job functions (e.g., `DATA_ENGINEER`, `ANALYST`).
- **Role Hierarchy:** Child roles inherit all privileges of parent roles; custom roles should always roll up to `SYSADMIN`.

```text
                 [ACCOUNTADMIN]
                 /            \
        [SECURITYADMIN]     [SYSADMIN]  <-- Custom Roles Roll Up Here
               |                 |
          [USERADMIN]     [DATA_ENGINEER_ROLE]
                                 |
                          [ETL_OPERATOR_ROLE]
```

### Example

```sql
-- Step 1: User administrator creates a custom functional role
USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS data_engineer_role;

-- Step 2: System administrator grants object privileges to the role
USE ROLE SYSADMIN;
GRANT USAGE ON WAREHOUSE ingest_wh TO ROLE data_engineer_role;
GRANT USAGE ON DATABASE retail_dw TO ROLE data_engineer_role;
GRANT USAGE ON SCHEMA retail_dw.raw_pos TO ROLE data_engineer_role;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA retail_dw.raw_pos TO ROLE data_engineer_role;

-- Step 3: Enforce Role Hierarchy (Roll up to SYSADMIN!)
GRANT ROLE data_engineer_role TO ROLE SYSADMIN;

-- Step 4: Assign role to user
USE ROLE USERADMIN;
GRANT ROLE data_engineer_role TO USER prasanth;
```

### Interview Q&A

**Q1: Why should custom roles always inherit up to SYSADMIN in the role hierarchy?**
**Answer:** It ensures that `SYSADMIN` (and consequently `ACCOUNTADMIN`) can manage, modify, and monitor all database objects created by custom roles. If a role does not roll up to `SYSADMIN`, objects created by that role become invisible and unmanageable by standard system administrators.

**Q2: What is the difference between SECURITYADMIN and USERADMIN?**
**Answer:** `USERADMIN` is restricted to creating and managing users and roles. `SECURITYADMIN` can create users and roles AND has the global `MANAGE GRANTS` privilege, allowing it to grant or revoke any privilege on any object account-wide.

**Q3: Can privileges be granted directly to a user in Snowflake?**
**Answer:** No. Snowflake enforces strict RBAC. Privileges can only be granted to Roles, and Roles are granted to Users.

### Common Pitfalls / Gotchas
- Creating custom roles that do not roll up to `SYSADMIN`, creating orphaned objects that administrators cannot manage.
- Granting `ACCOUNTADMIN` to developers for convenience; `ACCOUNTADMIN` should be restricted to at most 2–3 individuals in an organization.
- Granting sensitive access to the `PUBLIC` role, which automatically exposes data to every user in the Snowflake account.

### Quick Recap
- Privileges are granted to Roles; Roles are granted to Users.
- System roles: `ACCOUNTADMIN`, `SECURITYADMIN`, `USERADMIN`, `SYSADMIN`, `PUBLIC`.
- All custom functional roles must roll up to `SYSADMIN`.
- Principle of least privilege: reserve `ACCOUNTADMIN` for billing and top-level security.
- Systematically manage role hierarchies to prevent orphaned database objects.

---

![Data Masking & Security](https://img.shields.io/badge/Data_Masking_%26_RLS-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 5. Data Masking, Row-Level Security & Audit Trails

### Definition
Snowflake provides column-level **Dynamic Data Masking** and **Row Access Policies (RLS)** to obfuscate sensitive PII and restrict record visibility dynamically at query runtime based on the user's role, paired with comprehensive audit trails via `ACCESS_HISTORY`.

### Why it matters / Real-world use case
In a healthcare platform, HIPAA compliance requires that Customer Support representatives see masked Social Security Numbers (`***-**-1234`), while HR Compliance Officers see full SSNs (`123-45-6789`). Furthermore, regional managers may only view records where `region = 'US_SOUTH'`. Dynamic masking and Row Access Policies enforce both rules dynamically without duplicating data or creating separate filtered views.

### How it works
- **Dynamic Data Masking (Column-Level):** Evaluates `CURRENT_ROLE()` at query execution; returns masked strings or tokens to unauthorized roles while leaving underlying stored micro-partitions untouched.
- **Row Access Policies (Row-Level):** A SQL expression that acts as an invisible, mandatory filter applied to every query; returns true/false to determine row visibility.
- **Audit Trails (`ACCESS_HISTORY`):** Tracks direct queries, read columns, and downstream data movement (lineage) for every user across the account.

```text
Incoming Query: SELECT ssn, patient_name, region FROM patients;
                               |
       +-----------------------+-----------------------+
       | Masking Policy (Column-Level)                 | Row Access Policy (Row-Level)
       v                                               v
CURRENT_ROLE() == 'HR_ROLE' ? Full SSN : ***-**-XXXX   region == 'US_SOUTH' ? TRUE : FALSE (Filter Rows)
```

### Example

```sql
-- 1. Create Dynamic Data Masking Policy for SSN/Email
CREATE OR REPLACE MASKING POLICY ssn_mask AS (val STRING) RETURNS STRING ->
    CASE
        WHEN CURRENT_ROLE() IN ('HR_COMPLIANCE_ROLE', 'ACCOUNTADMIN') THEN val
        ELSE '***-**-' || RIGHT(val, 4)
    END;

-- Apply masking policy to table column
ALTER TABLE retail_dw.raw_pos.dim_customers
MODIFY COLUMN ssn SET MASKING POLICY ssn_mask;

-- 2. Create Row Access Policy for Regional Segregation
CREATE OR REPLACE ROW ACCESS POLICY region_policy AS (country_code STRING) RETURNS BOOLEAN ->
    CURRENT_ROLE() = 'GLOBAL_ADMIN'
    OR country_code = (SELECT user_country FROM retail_dw.raw_pos.user_entitlements WHERE username = CURRENT_USER());

-- Apply row access policy to table
ALTER TABLE retail_dw.raw_pos.dim_customers
ADD ROW ACCESS POLICY region_policy ON (country_code);

-- 3. Audit data access in Access History
SELECT
    query_id,
    user_name,
    direct_objects_accessed,
    query_start_time
FROM Snowflake.Account_Usage.ACCESS_HISTORY
WHERE query_start_time >= DATEADD('day', -1, CURRENT_TIMESTAMP())
LIMIT 5;
```

### Interview Q&A

**Q1: Does Dynamic Data Masking modify or encrypt data stored on disk?**
**Answer:** No. Dynamic Data Masking operates entirely at query runtime in the Cloud Services layer. Data remains fully unmasked in the physical storage layer; the masking expression simply transforms the returned value based on `CURRENT_ROLE()`.

**Q2: What happens if an unauthorized user attempts to clone a table protected by a Masking Policy?**
**Answer:** The masking policy travels with the cloned object. If an unauthorized user queries the cloned table, the masking policy continues to evaluate their role and returns masked data.

**Q3: What is the difference between QUERY_HISTORY and ACCESS_HISTORY?**
**Answer:** `QUERY_HISTORY` captures execution metrics (query text, warehouse size, duration, bytes scanned). `ACCESS_HISTORY` tracks data governance and compliance details, recording exactly which tables and individual columns were read or written, including through views.

### Common Pitfalls / Gotchas
- Applying masking policies on columns that serve as primary join keys; if an unauthorized role executes a join on masked values, joins can fail or yield incorrect results.
- Over-complicating Row Access Policies with slow subqueries, which severely degrades query execution performance across large fact tables.
- Querying `ACCOUNT_USAGE.ACCESS_HISTORY` and expecting immediate real-time metrics; `ACCOUNT_USAGE` views have an intentional 45–120 minute metadata latency.

### Quick Recap
- Dynamic Data Masking masks sensitive column values at query runtime without modifying disk storage.
- Row Access Policies restrict row-level visibility dynamically based on user context.
- Policies travel automatically with Zero-Copy Clones.
- `ACCESS_HISTORY` provides column-level auditability and compliance tracking.
- Policies eliminate the need to maintain duplicate filtered tables or hundreds of secure views.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Advanced dbt & Snapshots** | Automates SCD Type 2 history tracking with `valid_from`/`valid_to` timestamps and incremental merge. | High |
| **Task Orchestration** | Native workflow scheduling (CRON) and DAG execution for Stored Procedures without external tools. | High |
| **Python Connector & Auth** | Headless automated pipelines use Key-Pair (RSA 2048) authentication to bypass MFA securely. | High |
| **RBAC Governance** | Privileges granted to Roles, Roles to Users; all custom functional roles must roll up to `SYSADMIN`. | High |
| **Data Masking & Security** | Runtime column masking and row-level access policies paired with `ACCESS_HISTORY` compliance audit trails. | High |
