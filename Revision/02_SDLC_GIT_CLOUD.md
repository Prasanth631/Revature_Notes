# 02 — SDLC, Git, Cloud & Data Engineering

> **Structure:** Part A = 4–5 point curriculum notes. Part B = interview Q&A. Part C = scenario thinking.

## Part A — Curriculum Notes

### SDLC
- SDLC covers requirements, design, development, testing, deployment and maintenance.
- Waterfall is sequential; Agile is iterative and feedback-driven.
- Scrum organizes Agile work through sprints, planning, daily synchronization, review and retrospective.
- Story points estimate relative effort/complexity/uncertainty rather than exact hours.
- Interview point: explain process choices using requirements stability, feedback and delivery risk.

### Git / Source Control
- VCS tracks changes and supports collaboration and history.
- CVCS centers work on a central repository; DVCS gives developers distributed repository history.
- Core workflow: repository → branch → changes → stage → commit → push → pull request → merge.
- Fetch downloads remote changes without integrating them; pull normally fetches and integrates.
- Interview point: never commit secrets; use branches and review for controlled integration.

### Cloud
- IaaS provides infrastructure, PaaS provides a managed platform, SaaS provides complete software.
- AWS, Azure and GCP all provide compute, storage, networking, security and analytics capabilities.
- Cloud benefits include elasticity, managed services and rapid provisioning; challenges include cost, security and governance.
- Vertical scaling makes a resource larger; horizontal scaling adds resources.
- Interview point: compare clouds by capability, not by memorized service-name lists.

### Data Engineering Fundamentals
- Structured, semi-structured and unstructured data require different ingestion/storage approaches.
- DWH supports analytics; data lakes provide flexible raw storage; lakehouse patterns combine flexible storage with analytical table capabilities.
- ETL transforms before loading; ELT loads first and transforms in the target platform.
- Incremental and idempotent processing reduce unnecessary work and make reruns safer.
- Data quality, lineage, governance, monitoring, RTO/RPO and cost optimization are production concerns.


# Part B — Full Interview Q&A

# SDLC, Agile, Scrum and Git — Full Interview Q&A

> Expanded from every SDLC/Git topic named in the curriculum, using the same interview-note pattern as the supplied PySpark, Scala, Snowflake, and Fabric files.

### 1. What is SDLC?

**Answer:**
SDLC stands for Software Development Life Cycle. It is a structured process used to plan, design, develop, test, deploy, and maintain software.

**Example:**
```text
Requirements → Design → Development → Testing → Deployment → Maintenance
```

**Remember:** SDLC = complete software delivery lifecycle.

### 2. What are the main phases of SDLC?

**Answer:**
Common phases are requirements, design, development, testing, deployment, and maintenance. Organizations may use different names or combine phases.

**Example:**
```text
Requirements → Design → Development → Testing → Deployment → Maintenance
```

**Remember:** The names can vary; the lifecycle remains.

### 3. Why is SDLC important?

**Answer:**
SDLC gives the team a repeatable process for planning, quality, communication, risk management, and delivery.

**Example:**
```text
Testing before production reduces release risk.
```

**Remember:** SDLC = controlled delivery.

### 4. What happens during requirements gathering?

**Answer:**
The team identifies the business problem, users, expected behavior, constraints, data needs, and acceptance criteria.

**Example:**
```text
Daily sales must be available by 6 AM.
```

**Remember:** Clear requirements reduce rework.

### 5. What happens during the design phase?

**Answer:**
The team decides how the solution will work, including components, data flow, interfaces, storage, and security.

**Example:**
```text
Source → Lakehouse → transformation → reporting.
```

**Remember:** Design turns needs into a solution.

### 6. What happens during development?

**Answer:**
Developers implement the approved design by writing code, configurations, database objects, tests, and documentation.

**Example:**
```text
Create the PySpark transformation and SQL tables.
```

**Remember:** Development implements the design.

### 7. What happens during testing?

**Answer:**
Testing verifies functional behavior and finds defects before release. It can include unit, integration, system, regression, and acceptance testing.

**Example:**
```text
Validate that invalid records are rejected.
```

**Remember:** Testing protects quality.

### 8. What is deployment?

**Answer:**
Deployment moves a tested version into a usable environment such as production.

**Example:**
```text
Development → Test → Production
```

**Remember:** Deploy in a controlled way.

### 9. What is maintenance?

**Answer:**
Maintenance fixes defects, improves performance, adapts systems to changes, and delivers enhancements after deployment.

**Example:**
```text
Update a pipeline after a source schema change.
```

**Remember:** Production work continues after release.

### 10. What is Waterfall?

**Answer:**
Waterfall is a sequential development model in which phases generally proceed in order. It works best when requirements are stable.

**Example:**
```text
Requirements → Design → Build → Test → Release
```

**Remember:** Waterfall = sequential.

### 11. Advantages of Waterfall?

**Answer:**
It provides clear phases, documentation, and predictable planning when requirements are stable.

**Example:**
```text
Regulated project with fixed requirements.
```

**Remember:** Good fit for low-change work.

### 12. Disadvantages of Waterfall?

**Answer:**
Late feedback can make changes expensive because earlier phases may already be complete.

**Example:**
```text
A requirement discovered in testing may require redesign.
```

**Remember:** Late change is expensive.

### 13. What is Agile?

**Answer:**
Agile is an iterative and incremental approach that delivers smaller increments and uses frequent feedback.

**Example:**
```text
Sprint 1 → feedback → Sprint 2
```

**Remember:** Agile = iterative + adaptive.

### 14. What are Agile benefits?

**Answer:**
Agile provides frequent feedback, visibility, adaptability, and incremental delivery.

**Example:**
```text
Release a basic dashboard first, then add features.
```

**Remember:** Agile expects controlled change.

### 15. What are Agile limitations?

**Answer:**
Agile still requires planning, architecture, priorities, testing, and governance. Poorly managed Agile can become uncontrolled change.

**Example:**
```text
Changing scope every day without priorities causes instability.
```

**Remember:** Agile is not no-planning.

### 16. Agile vs Waterfall?

**Answer:**
Waterfall is sequential and prefers stable requirements. Agile is iterative and expects feedback and controlled change during delivery.

**Example:**
```text
Agile: incremental; Waterfall: phase-based.
```

**Remember:** Agile = change-friendly; Waterfall = sequence-driven.

### 17. What is a user story?

**Answer:**
A user story describes a need from the user perspective and connects the need to business value.

**Example:**
```text
As a sales analyst, I want regional totals so I can compare markets.
```

**Remember:** User story = need + value.

### 18. What are acceptance criteria?

**Answer:**
Acceptance criteria are conditions that must be satisfied for a requirement to be considered complete and accepted.

**Example:**
```text
File must load all valid rows by 2 AM.
```

**Remember:** Acceptance criteria define done.

### 19. What are story points?

**Answer:**
Story points are relative estimates of effort, complexity, and uncertainty. They are not directly equal to hours.

**Example:**
```text
Story A = 2 points; Story B = 5 points.
```

**Remember:** Relative, not time units.

### 20. Why use story points?

**Answer:**
They help teams compare work and estimate sprint capacity based on historical delivery.

**Example:**
```text
A team usually completes around 30 points per sprint.
```

**Remember:** Points support planning.

### 21. What is Scrum?

**Answer:**
Scrum is an Agile framework that organizes work into short sprints with defined events and responsibilities.

**Example:**
```text
Sprint → Increment → feedback
```

**Remember:** Scrum is one Agile framework.

### 22. What is Sprint Planning?

**Answer:**
The team agrees on the sprint goal, selects work, and plans how it will be completed.

**Example:**
```text
Choose stories needed for a release increment.
```

**Remember:** Plan sprint work.

### 23. What is the Daily Scrum?

**Answer:**
It is a short team synchronization used to align on progress, next work, and blockers.

**Example:**
```text
Yesterday / today / blocker.
```

**Remember:** Synchronize, do not hold a long status meeting.

### 24. What is a Sprint Review?

**Answer:**
The completed increment is demonstrated and stakeholder feedback is collected.

**Example:**
```text
Demo the Gold sales report.
```

**Remember:** Review the product increment.

### 25. What is a Retrospective?

**Answer:**
The team reflects on the sprint and chooses process improvements for future work.

**Example:**
```text
Add schema validation after a pipeline incident.
```

**Remember:** Retrospective = improve process.

### 26. What is a product backlog?

**Answer:**
It is the ordered list of desired work, fixes, requirements, and enhancements.

**Example:**
```text
Ingestion, dashboard, security, optimization.
```

**Remember:** Backlog = prioritized work.

### 27. What is a sprint backlog?

**Answer:**
It contains the work selected for the current sprint and the plan to deliver it.

**Example:**
```text
Product backlog → selected sprint work
```

**Remember:** Sprint backlog = current sprint scope.

### 28. What is version control?

**Answer:**
Version control records file changes and supports collaboration, history, branching, merging, and recovery.

**Example:**
```text
Git tracks code changes by commit.
```

**Remember:** Version control = history + collaboration.

### 29. What is VCS?

**Answer:**
A Version Control System manages versions of files over time.

**Example:**
```text
Git is a VCS.
```

**Remember:** VCS tracks versions.

### 30. What is CVCS?

**Answer:**
Centralized version control uses a central repository as the main shared source of versioned data.

**Example:**
```text
Developer → Central Server
```

**Remember:** Centralized repository model.

### 31. What is DVCS?

**Answer:**
Distributed version control gives each clone repository history locally. Git is distributed.

**Example:**
```text
Developer A and B each have local history.
```

**Remember:** Git = distributed.

### 32. What is Git?

**Answer:**
Git is a distributed version control system for tracking changes and collaborating on software projects.

**Example:**
```text
git init → add → commit → push
```

**Remember:** Git manages version history.

### 33. What is a Git repository?

**Answer:**
A repository contains tracked project files and Git history. It can be local and can connect to a remote repository.

**Example:**
```text
Project folder initialized with git init.
```

**Remember:** Repository = files + history.

### 34. How do you initialize a repository?

**Answer:**
Run git init inside the project directory.

**Example:**
```text
git init
```

**Remember:** Starts local Git tracking.

### 35. What does git status do?

**Answer:**
It shows modified, staged, and untracked files and the current branch state.

**Example:**
```text
git status
```

**Remember:** Check status before committing.

### 36. What does git add do?

**Answer:**
It stages changes for the next commit.

**Example:**
```text
git add .
```

**Remember:** add = stage.

### 37. What is a commit?

**Answer:**
A commit records a snapshot of staged changes in local history.

**Example:**
```text
git commit -m "Add validation"
```

**Remember:** Commit = checkpoint.

### 38. What is a branch?

**Answer:**
A branch is an independent line of development used to isolate changes.

**Example:**
```text
git checkout -b feature/load-sales
```

**Remember:** Branch = isolated work.

### 39. Why use branches?

**Answer:**
Branches allow multiple features or fixes to be developed without directly changing the stable branch.

**Example:**
```text
feature/a and feature/b work in parallel.
```

**Remember:** Branch before independent work.

### 40. What is merge?

**Answer:**
Merge combines changes from one branch into another branch.

**Example:**
```text
git checkout main
git merge feature/load-sales
```

**Remember:** Merge = combine histories.

### 41. What is a merge conflict?

**Answer:**
A conflict occurs when Git cannot automatically reconcile competing changes.

**Example:**
```text
Both branches edit the same lines.
```

**Remember:** Conflict requires a human decision.

### 42. How resolve a merge conflict?

**Answer:**
Inspect the conflict markers, choose the correct content, remove markers, test, stage, and commit the resolution.

**Example:**
```text
<<<<<<< HEAD ... ======= ... >>>>>>>
```

**Remember:** Resolve → test → stage.

### 43. What is a remote repository?

**Answer:**
A remote is a named reference to another repository, usually hosted for collaboration.

**Example:**
```text
git remote -v
```

**Remember:** Remote = shared endpoint.

### 44. How add a remote?

**Answer:**
Use git remote add with the remote name and repository URL.

**Example:**
```text
git remote add origin <url>
```

**Remember:** origin is conventional.

### 45. What does git push do?

**Answer:**
It sends local commits to a remote repository.

**Example:**
```text
git push -u origin main
```

**Remember:** push = local → remote.

### 46. What does git pull do?

**Answer:**
It fetches remote changes and integrates them into the current branch according to configuration.

**Example:**
```text
git pull
```

**Remember:** pull = fetch + integrate.

### 47. What does git fetch do?

**Answer:**
It downloads remote changes without integrating them into the current branch.

**Example:**
```text
git fetch origin
```

**Remember:** fetch = download only.

### 48. fetch vs pull?

**Answer:**
fetch gives you remote updates without changing your current branch; pull also performs integration.

**Example:**
```text
fetch → inspect → merge/rebase; pull → fetch + integrate.
```

**Remember:** Use fetch for more control.

### 49. What is a pull request?

**Answer:**
A pull request asks for review and controlled integration of changes from one branch into another.

**Example:**
```text
feature → PR → review → merge
```

**Remember:** PR = controlled integration.

### 50. What is code review?

**Answer:**
Code review is peer inspection of changes for correctness, readability, security, testing, and maintainability.

**Example:**
```text
Reviewer checks a SQL change before merge.
```

**Remember:** Review catches issues early.

### 51. What is a typical Git workflow?

**Answer:**
Update local branch, create feature branch, code, test, commit, push, open PR, review, merge, then update local branch.

**Example:**
```text
clone → branch → code → test → commit → PR → merge
```

**Remember:** Keep stable branches stable.

### 52. Why is Git useful for data engineering?

**Answer:**
Data projects include Python, SQL, notebooks, pipeline definitions, tests, configs, and documentation. Git provides traceability for these artifacts.

**Example:**
```text
Commit a PySpark change and its test.
```

**Remember:** Data engineering also needs version control.

### 53. What should not be committed?

**Answer:**
Passwords, private keys, access tokens, production secrets, and sensitive data should not be placed in source control.

**Example:**
```text
Use secret management instead.
```

**Remember:** Never commit credentials.

### 54. What is .gitignore?

**Answer:**
It lists files and paths Git should normally ignore.

**Example:**
```text
__pycache__/
.env
*.log
```

**Remember:** .gitignore prevents accidental tracking.

### 55. What is a tag?

**Answer:**
A tag is a named reference to a specific Git commit, often used for releases.

**Example:**
```text
git tag v1.0.0
```

**Remember:** Tag = named release point.

### 56. What is cherry-pick?

**Answer:**
It applies the change from a selected commit onto the current branch.

**Example:**
```text
git cherry-pick abc123
```

**Remember:** Cherry-pick = selected commit.

### 57. What is revert?

**Answer:**
Revert creates a new commit that undoes the effect of an earlier commit without rewriting shared history.

**Example:**
```text
git revert <commit>
```

**Remember:** Revert is safer for shared history.

### 58. What is a fast-forward merge?

**Answer:**
It occurs when the target branch has not diverged and can simply move the branch pointer forward.

**Example:**
```text
main pointer moves to feature tip.
```

**Remember:** Fast-forward = linear extension.

### 59. Why are commit messages important?

**Answer:**
They explain intent and make history easier to review, troubleshoot, and audit.

**Example:**
```text
git commit -m "Fix incremental watermark"
```

**Remember:** Good history helps debugging.

### 60. How do you work safely with main?

**Answer:**
Keep main stable, work on branches, run tests, use pull requests and reviews, and merge only validated changes.

**Example:**
```text
feature branch → CI → PR → main
```

**Remember:** Protect stable branches.


# Part C — Cloud/Data-Engineering Full Q&A

# Cloud + Data Engineering — Full Interview Q&A (Curriculum-Aligned)
> Detailed Q&A for the cloud/data-engineering topics explicitly named in the curriculum: service models, AWS/Azure/GCP, pricing, data types/formats, stores, OLTP/OLAP, warehouse/lake/mart, cleansing, modeling, SCD, ETL/ELT, governance, resilience, and pipeline concepts.

### 1. What is cloud computing?

**Answer:**
Cloud computing provides on-demand compute, storage, networking, databases, and other services without requiring every organization to own the underlying physical infrastructure.

**Example:**
```text
Create compute only when a workload runs.
```

**Remember:** Cloud = on-demand resources.

### 2. What is IaaS?

**Answer:**
Infrastructure as a Service provides infrastructure resources while the customer manages more of the software stack.

**Example:**
```text
Virtual machines.
```

**Remember:** IaaS = infrastructure.

### 3. What is PaaS?

**Answer:**
Platform as a Service provides a managed platform so users focus more on applications and data.

**Example:**
```text
Managed database/application platform.
```

**Remember:** PaaS = managed platform.

### 4. What is SaaS?

**Answer:**
Software as a Service provides a complete application/service managed by the provider.

**Example:**
```text
Microsoft Fabric.
```

**Remember:** SaaS = complete service.

### 5. IaaS vs PaaS vs SaaS?

**Answer:**
The provider manages more infrastructure as you move from IaaS toward SaaS.

**Example:**
```text
VM → managed platform → complete application.
```

**Remember:** Know responsibility boundaries.

### 6. What are cloud benefits?

**Answer:**
Elasticity, faster provisioning, managed services, global options, and usage-based economics are common benefits.

**Example:**
```text
Scale compute during month-end.
```

**Remember:** Cloud reduces infrastructure management.

### 7. What are cloud challenges?

**Answer:**
Cost control, security, governance, networking, skills, vendor dependence, data residency, and operational complexity remain important challenges.

**Example:**
```text
Oversized compute creates unnecessary cost.
```

**Remember:** Cloud still needs governance.

### 8. How do AWS, Azure and GCP compare at a high level?

**Answer:**
All provide compute, storage, databases, networking, IAM/security, monitoring, analytics, and integration capabilities. Service names differ.

**Example:**
```text
Compare by capability rather than names only.
```

**Remember:** Capability-first comparison.

### 9. What is cloud pricing?

**Answer:**
Pricing commonly depends on compute usage, storage, data transfer, service tier, concurrency, and duration.

**Example:**
```text
24/7 warehouse costs more than a warehouse that suspends during idle time.
```

**Remember:** Cost follows resource usage.

### 10. What is structured data?

**Answer:**
Data that follows a predefined tabular schema such as rows and columns.

**Example:**
```text
Relational employee table.
```

**Remember:** Structured = fixed shape.

### 11. What is semi-structured data?

**Answer:**
Data with flexible or nested structure rather than a rigid relational schema.

**Example:**
```text
JSON event.
```

**Remember:** Semi-structured = flexible/nested.

### 12. What is unstructured data?

**Answer:**
Data that does not naturally fit a fixed tabular schema.

**Example:**
```text
Images, PDFs, video.
```

**Remember:** Unstructured still contains information.

### 13. What is CSV?

**Answer:**
A text-based delimited format for tabular data. It is simple and interoperable but not ideal for large analytical workloads.

**Example:**
```text
101,Rajiv,IT
```

**Remember:** CSV = simple interchange.

### 14. What is JSON?

**Answer:**
A text-based format for exchanging nested or hierarchical data, widely used in APIs and events.

**Example:**
```text
{"id":101,"name":"A"}
```

**Remember:** JSON = flexible/nested.

### 15. What is Parquet?

**Answer:**
A columnar file format designed for efficient analytical processing and column-level access.

**Example:**
```text
Large sales dataset stored in Parquet.
```

**Remember:** Parquet = analytical columnar.

### 16. What is Avro?

**Answer:**
A schema-oriented data serialization format used for structured/semi-structured data exchange and storage.

**Example:**
```text
Events serialized with an Avro schema.
```

**Remember:** Avro = schema-based.

### 17. What is ORC?

**Answer:**
ORC is a columnar format designed for efficient analytical storage and processing.

**Example:**
```text
Historical analytical data in ORC.
```

**Remember:** ORC = columnar.

### 18. CSV vs Parquet?

**Answer:**
CSV is simple text; Parquet is columnar and generally more efficient for analytical workloads.

**Example:**
```text
CSV for interchange, Parquet for analytical pipelines.
```

**Remember:** Choose based on workload.

### 19. What is a relational database?

**Answer:**
It stores related data in tables and uses keys and constraints to maintain relationships.

**Example:**
```text
Customer and Orders tables.
```

**Remember:** Relational = tables + relationships.

### 20. What is a data warehouse?

**Answer:**
A data warehouse is an analytical store for curated structured data used by reporting and decision making.

**Example:**
```text
FactSales + dimensions.
```

**Remember:** Warehouse = curated analytics.

### 21. What is a data lake?

**Answer:**
A flexible storage environment for large volumes of raw and varied data.

**Example:**
```text
Raw CSV, JSON, Parquet.
```

**Remember:** Lake = flexible raw storage.

### 22. What is a lakehouse?

**Answer:**
A lakehouse combines flexible data-lake storage with managed table and analytical capabilities.

**Example:**
```text
Files + Delta tables.
```

**Remember:** Lakehouse = lake flexibility + tables.

### 23. What is an Operational Data Store?

**Answer:**
An ODS provides integrated current or near-current data for operational reporting and integration.

**Example:**
```text
Current customer status.
```

**Remember:** ODS = current operational data.

### 24. What is a data mart?

**Answer:**
A subject- or department-specific analytical store.

**Example:**
```text
Sales data mart.
```

**Remember:** Mart = focused analytics.

### 25. What is DWH architecture?

**Answer:**
A conceptual warehouse architecture includes source systems, ingestion/staging, transformation, curated storage, and reporting/BI.

**Example:**
```text
Sources → ingestion → transform → warehouse → BI
```

**Remember:** Think in layers.

### 26. What is data cleansing?

**Answer:**
The process of finding and fixing or isolating duplicates, nulls, bad types, invalid values, and inconsistent formats.

**Example:**
```text
Remove duplicate order_id and standardize dates.
```

**Remember:** Clean before trust.

### 27. What is denormalization?

**Answer:**
Intentionally combining or duplicating information to simplify reads or improve analytical performance.

**Example:**
```text
Flatten product category attributes for BI.
```

**Remember:** Denormalize deliberately.

### 28. What is conceptual modeling?

**Answer:**
A business-level description of major entities and relationships without implementation detail.

**Example:**
```text
Customer, Order, Product.
```

**Remember:** Conceptual = business view.

### 29. What is logical modeling?

**Answer:**
A detailed representation of attributes and relationships that is still largely independent of a specific database engine.

**Example:**
```text
Customer(customer_id,name,region).
```

**Remember:** Logical = detailed structure.

### 30. What is physical modeling?

**Answer:**
Mapping the logical design to real tables, columns, types, keys, partitions/indexes, and platform-specific features.

**Example:**
```text
Snowflake CREATE TABLE definitions.
```

**Remember:** Physical = implementation.

### 31. What is dimensional modeling?

**Answer:**
A modeling style for analytics using fact and dimension tables.

**Example:**
```text
FactSales + DimDate + DimCustomer.
```

**Remember:** Dimensional = BI-oriented.

### 32. What is a fact table?

**Answer:**
It stores measurable business events, usually linked to dimensions through keys.

**Example:**
```text
FactSales(amount,date_key,customer_key).
```

**Remember:** Fact = measurable event.

### 33. What is a dimension table?

**Answer:**
It stores descriptive attributes used to analyze facts.

**Example:**
```text
DimCustomer(name,region).
```

**Remember:** Dimension = context.

### 34. What is ETL?

**Answer:**
Extract, Transform, Load means transformation happens before data is loaded into the target.

**Example:**
```text
Source → transform → warehouse.
```

**Remember:** ETL = transform before load.

### 35. What is ELT?

**Answer:**
Extract, Load, Transform means data is loaded into the target first and transformed there.

**Example:**
```text
Source → lake/warehouse → transform.
```

**Remember:** ELT = transform in target.

### 36. ETL vs ELT?

**Answer:**
ETL transforms before loading; ELT loads first and transforms in the destination. ELT is often attractive when the target has scalable compute.

**Example:**
```text
Cloud warehouse executes transformations after load.
```

**Remember:** Choose from architecture and workload.

### 37. What is batch ingestion?

**Answer:**
Process data in groups at scheduled or predefined intervals.

**Example:**
```text
Nightly sales load.
```

**Remember:** Batch = groups.

### 38. What is incremental ingestion?

**Answer:**
Load only new or changed records rather than rebuilding the full dataset each time.

**Example:**
```text
updated_at > last_watermark.
```

**Remember:** Incremental = less data moved.

### 39. Can a pipeline be both batch and incremental?

**Answer:**
Yes. Batch describes when data is processed; incremental describes which data is processed.

**Example:**
```text
Nightly incremental load.
```

**Remember:** They are not opposites.

### 40. What is a watermark?

**Answer:**
A stored progress value indicating how far an incremental process has successfully read or processed data.

**Example:**
```text
last_successful_timestamp.
```

**Remember:** Advance only after success.

### 41. What is idempotency?

**Answer:**
A retry produces the same correct final state instead of creating duplicate effects.

**Example:**
```text
Rerunning a batch does not double sales rows.
```

**Remember:** Idempotent = safe to retry.

### 42. What makes incremental ingestion reliable?

**Answer:**
Use a reliable change indicator, deterministic extraction, validation, idempotent writes, and careful watermark advancement.

**Example:**
```text
Extract → validate → merge → update watermark.
```

**Remember:** Do not advance progress early.

### 43. What is data quality?

**Answer:**
It measures whether data is accurate, complete, consistent, valid, unique, timely, and fit for purpose.

**Example:**
```text
Check order_id uniqueness and amount >= 0.
```

**Remember:** Quality is business-specific.

### 44. What are common data-quality checks?

**Answer:**
Null checks, uniqueness, ranges, accepted values, foreign-key consistency, freshness, schema checks, row counts, and reconciliations.

**Example:**
```text
Compare source and target row counts.
```

**Remember:** Automate checks when possible.

### 45. What is schema evolution?

**Answer:**
Schema evolution is the controlled change of columns or data structure over time.

**Example:**
```text
Source adds customer_segment.
```

**Remember:** Schema changes need testing.

### 46. What is metadata?

**Answer:**
Information about data such as schema, location, type, owner, freshness, or storage statistics.

**Example:**
```text
Column type and owner.
```

**Remember:** Metadata improves discoverability and optimization.

### 47. What is data lineage?

**Answer:**
It shows how data flows from sources through transformations to downstream assets.

**Example:**
```text
CRM → Lakehouse → Warehouse → BI.
```

**Remember:** Lineage supports impact analysis.

### 48. What is data governance?

**Answer:**
Policies and practices for data ownership, quality, security, lifecycle, access, and responsible usage.

**Example:**
```text
RBAC + quality + retention + lineage.
```

**Remember:** Governance makes data trustworthy.

### 49. What is RTO?

**Answer:**
Recovery Time Objective is the target time to restore a service after disruption.

**Example:**
```text
RTO = 2 hours.
```

**Remember:** RTO = time to recover.

### 50. What is RPO?

**Answer:**
Recovery Point Objective is the acceptable amount of data loss measured in time.

**Example:**
```text
RPO = 15 minutes.
```

**Remember:** RPO = data loss tolerance.

### 51. What is disaster recovery?

**Answer:**
The strategy and procedures used to restore systems and data after major failures.

**Example:**
```text
Backup/replication + tested recovery.
```

**Remember:** Recovery plans must be tested.

### 52. What is failover?

**Answer:**
Switching workload to a healthy alternate resource or environment after failure.

**Example:**
```text
Primary region fails → secondary region.
```

**Remember:** Failover = continue service elsewhere.

### 53. What is replication?

**Answer:**
Copying data or state to another location/resource for resilience, availability, or distribution.

**Example:**
```text
Cross-region replica.
```

**Remember:** Replication adds cost/complexity.

### 54. What is high availability?

**Answer:**
Designing for continued service despite component failures through redundancy and resilient architecture.

**Example:**
```text
Multiple redundant resources.
```

**Remember:** HA reduces downtime.

### 55. What is scalability?

**Answer:**
The ability to handle increased workload by adding resources.

**Example:**
```text
Increase Spark compute for 10× data.
```

**Remember:** Scale with demand.

### 56. Vertical vs horizontal scaling?

**Answer:**
Vertical scaling increases the size of an existing resource; horizontal scaling adds more resources or nodes.

**Example:**
```text
Bigger warehouse vs more clusters.
```

**Remember:** Vertical = bigger; horizontal = more.

### 57. What is elasticity?

**Answer:**
The ability to adjust resource levels quickly or automatically in response to workload demand.

**Example:**
```text
Add compute during peak usage.
```

**Remember:** Elasticity follows demand.

### 58. What is data partitioning?

**Answer:**
Dividing data into logical pieces based on keys such as date or region to improve parallelism or access.

**Example:**
```text
sales/year=2026/month=09.
```

**Remember:** Partition based on access patterns.

### 59. Why use Parquet/columnar formats in analytics?

**Answer:**
They can reduce I/O by reading only required columns and can compress analytical data efficiently.

**Example:**
```text
Query only amount and date columns.
```

**Remember:** Columnar supports analytical scans.

### 60. What is orchestration?

**Answer:**
Orchestration controls task order, dependencies, schedules, retries, and monitoring across a data workflow.

**Example:**
```text
Copy → transform → validate → publish.
```

**Remember:** Orchestration coordinates work.

### 61. Orchestration vs transformation?

**Answer:**
Transformation changes data. Orchestration controls how and when transformations and other tasks run.

**Example:**
```text
PySpark transforms; pipeline orchestrates.
```

**Remember:** Data logic vs workflow logic.

### 62. What is retry strategy?

**Answer:**
Retries should target transient failures such as temporary network issues while permanent data-quality errors should usually fail fast.

**Example:**
```text
Retry timeout; fail invalid schema.
```

**Remember:** Retry transient errors.

### 63. What is observability?

**Answer:**
Observability uses logs, metrics, traces, alerts, and lineage to understand system health and behavior.

**Example:**
```text
Monitor runtime, freshness, row counts.
```

**Remember:** Observability shortens diagnosis.

### 64. What is cloud cost optimization?

**Answer:**
Use only necessary resources and reduce avoidable compute, storage, and data movement through right-sizing, scheduling, efficient formats, incremental processing, and monitoring.

**Example:**
```text
Incremental Parquet processing instead of full CSV scans.
```

**Remember:** Optimize performance and cost together.

### 65. What is an SLA?

**Answer:**
A Service Level Agreement defines expected service levels such as freshness, availability, or response time.

**Example:**
```text
Data available by 6 AM.
```

**Remember:** SLA = agreed target.
