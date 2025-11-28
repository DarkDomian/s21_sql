## SQL Bootcamp - `team01`

<a href="ex00/team01_ex00.sql"><b>Exercise 00 - Classical DWH</b></a> — Implements foundational data warehouse integration by consolidating disparate microservice data sources into unified analytical views. Creates comprehensive financial reporting that resolves data consistency issues across independent operational databases, providing complete visibility into user balances with proper currency conversions and NULL value handling for reliable business intelligence.

<a href="ex01/team01_ex01.sql"><b>Exercise 01 - Detailed Query</b></a> — Develops advanced temporal data analysis by implementing nearest-rate currency conversion algorithm that handles historical currency fluctuations. Enables precise USD valuation of financial transactions using sophisticated date matching logic that searches both past and future rate periods, ensuring accurate financial reporting even with irregular currency update patterns.

---
<!--
### Business Value & Technical Insights

**Exercise 00** delivers critical financial consolidation capabilities by:
- **Business Impact**: Provides unified view of user financial positions across fragmented microservices, enabling accurate balance reporting and currency exposure analysis
- **Technical Approach**: Implements COALESCE-based NULL handling, SUM aggregation with GROUP BY, and temporal currency rate selection using DISTINCT ON/LIMIT
- **Data Governance**: Establishes fallback patterns (`not defined` values, default rate of 1) ensuring report completeness despite source data anomalies

**Exercise 01** enables precise financial analytics through:
- **Business Impact**: Delivers transaction-level currency conversion accuracy for compliance, auditing, and financial reporting requirements
- **Technical Approach**: Implements complex temporal joins using LATERAL/ correlated subqueries with UNION ALL for bidirectional rate matching (past → future search)
- **Analytical Power**: Solves the "stale currency rates" problem in financial systems by finding the closest applicable exchange rate for each transaction

### Key SQL Patterns & Cheat Sheet

```sql
-- NULL handling and defaults
COALESCE(column, 'not defined')
COALESCE(rate, 1)

-- Temporal rate selection (nearest past/future)
(SELECT rate FROM currency 
 WHERE currency.id = balance.currency_id 
   AND currency.updated <= balance.updated
 ORDER BY currency.updated DESC LIMIT 1)

-- Aggregation with multi-table joins  
SUM(money) OVER (PARTITION BY user_id, type)
```

### Microservice Integration Challenges Solved
- **Data Consistency**: Handles missing relations between User-Balance-Currency entities
- **Temporal Alignment**: Matches transaction dates with appropriate currency rates
- **Completeness**: Ensures all data reported regardless of source system gaps
- **Currency Accuracy**: Maintains financial precision through sophisticated rate matching

These exercises establish enterprise-grade financial reporting foundations that transform fragmented operational data into trustworthy business intelligence.

-->