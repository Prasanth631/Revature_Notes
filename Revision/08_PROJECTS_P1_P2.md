# 08 — Projects P1 & P2 Interview Preparation

> **Important:** This file separates verified project references from interview-preparation guidance. Do not invent implementation details that are not actually in the project/source material.

# Project 1 — Disaster-Affected Region Tracker Analysis

## Known project reference
Repository:
`https://github.com/HarshaVinay/Disaster-Affected-Region-Tracker-Analysis`

## How to prepare
Be ready to explain:
1. Business problem
2. Source data
3. Data ingestion
4. Data cleaning/validation
5. Transformations
6. Storage/model
7. Analytics/reporting
8. Technologies actually used
9. Challenges and fixes
10. Your individual contribution

## Interview answer structure
**Problem → Data → Pipeline → Transformation → Storage → Analytics → Challenge → Result**

## Questions to practice
- What is the project about?
- What was the source data?
- Why did you choose the technologies used?
- How did you validate the data?
- How did you handle missing/duplicate/invalid records?
- What transformations did you perform?
- What was the final analytical output?
- What was the most difficult problem?
- How did you debug it?
- If you redesigned it today, what would you improve?

# Project 2 — Cricket Analytics Platform (Match + Ball-by-Ball)

## Project purpose
The project is designed to ingest teams, players, matches and deliveries and enable ball-level analytics across batting, bowling, phases, venues and formats.

## Landing structure
```text
/landing/cricket_analytics/
    teams/
    players/
    matches/
    deliveries/
    quarantine/
    archive/
```

## Source entities
- `cricket_teams.csv`
- `players`
- `matches`
- `deliveries`

## Data-engineering architecture to be able to explain
```text
Source CSVs
   ↓
Landing
   ↓
Validation / Quarantine
   ↓
Bronze
   ↓
Silver
   ↓
Gold
   ↓
Analytical SQL / BI
```

## Important interview themes
- File ingestion and schema validation
- Bad-record quarantine
- Archive after processing
- Incremental loading
- Primary/foreign-key relationships
- Match → innings → delivery grain
- Batting and bowling metrics
- Phase analytics
- Venue/format analysis
- Fact/dimension modeling
- Reprocessing/idempotency
- Data-quality reconciliation

## Questions to practice
- What is the grain of the deliveries data?
- How would you avoid duplicate deliveries?
- How would you model matches and players?
- How would you calculate batting strike rate?
- How would you calculate economy rate?
- How would you identify powerplay/middle/death phases?
- How would you handle a malformed delivery file?
- How would you implement incremental ingestion?
- How would you quarantine invalid records?
- How would you make reruns idempotent?
- What would you store in Bronze, Silver and Gold?
- How would you expose Gold data to analysts?
- What SQL joins would you use?
- How would you optimize the largest delivery table?
- How would you monitor daily pipeline success?

## Project 2 — Example SQL thinking

### Top run scorers
```sql
SELECT batter, SUM(runs_scored) AS total_runs
FROM deliveries
GROUP BY batter
ORDER BY total_runs DESC;
```

### Bowling economy
```sql
SELECT bowler,
       SUM(runs_conceded) / NULLIF(SUM(legal_balls), 0) * 6 AS economy
FROM bowling_summary
GROUP BY bowler;
```

> Adapt column names to the actual project schema. Do not claim these exact column names unless they exist in the project.

## Project interview rule

If asked something you did not personally implement, say:
> "I understand the approach, but I would not claim I implemented that part myself."

That is safer and more credible than inventing details.
