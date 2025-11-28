## SQL Bootcamp - `functions-and-procs`

<a href="ex00/day09_ex00.sql"><b>Exercise 00</b></a> — Implements comprehensive data auditing by creating a `person_audit` table with full change tracking capabilities, including event timestamps and operation types. Establishes robust audit trail foundation with constraint validation and default values for reliable data governance.

<a href="ex01/day09_ex01.sql"><b>Exercise 01</b></a> — Extends audit framework to handle update operations by creating specialized trigger function that captures previous state data before modifications. Ensures complete historical record of all person table changes for compliance and data lineage tracking.

<a href="ex02/day09_ex02.sql"><b>Exercise 02</b></a> — Completes comprehensive audit coverage by implementing delete operation tracking, preserving final state of records before removal. Provides full lifecycle monitoring for data retention and regulatory compliance requirements.

<a href="ex03/day09_ex03.sql"><b>Exercise 03</b></a> — Optimizes audit infrastructure by consolidating multiple triggers into unified solution that handles all DML operations through single function. Improves maintainability and performance while maintaining complete audit trail across insert, update, and delete events.

<a href="ex04/day09_ex04.sql"><b>Exercise 04</b></a> — Implements data access layer using database functions for gender-based person segmentation. Creates reusable function-based interfaces that provide structured data access patterns while abstracting underlying table structure.

<a href="ex05/day09_ex05.sql"><b>Exercise 05</b></a> — Enhances data access flexibility through parameterized function design, replacing multiple specialized functions with single adaptable solution. Enables dynamic filtering with default parameters for simplified query patterns.

<a href="ex06/day09_ex06.sql"><b>Exercise 06</b></a> — Develops advanced business analytics function combining visit history with price filtering capabilities. Enables complex multi-table analysis through pl/pgsql implementation for personalized customer behavior insights.

<a href="ex07/day09_ex07.sql"><b>Exercise 07</b></a> — Creates mathematical utility function for array processing with variadic parameter support. Demonstrates PostgreSQL's advanced function capabilities for numerical analysis and data transformation workflows.

<a href="ex08/day09_ex08.sql"><b>Exercise 08</b></a> — Implements mathematical sequence generation through Fibonacci algorithm with configurable termination criteria. Showcases set-based programming approach for mathematical computations directly within database layer.