## SQL bootcamp - `isolation-levels`

<a href="ex00/day08_ex00.sql"><b>Exercise 00</b></a> — Demonstrates transaction isolation by showing how uncommitted changes remain invisible to other sessions until committed, ensuring data consistency across concurrent database connections.

<a href="ex01/day08_ex01.sql"><b>Exercise 01</b></a> — Reproduces the Lost Update anomaly where concurrent rating updates conflict, showing how one session's changes can overwrite another's without proper isolation controls.

<a href="ex02/day08_ex02.sql"><b>Exercise 02</b></a> — Tests Repeatable Read isolation level's ability to prevent Lost Update anomalies by maintaining consistent data views throughout transaction duration.

<a href="ex03/day08_ex03.sql"><b>Exercise 03</b></a> — Demonstrates Non-Repeatable Reads anomaly where committed changes from one session become visible to another during transaction execution.

<a href="ex04/day08_ex04.sql"><b>Exercise 04</b></a> — Validates Serializable isolation level's protection against Non-Repeatable Reads by ensuring transaction consistency through strict serial execution.

<a href="ex05/day08_ex05.sql"><b>Exercise 05</b></a> — Reproduces Phantom Reads anomaly where new data inserted during transaction execution affects aggregate query results inconsistently.

<a href="ex06/day08_ex06.sql"><b>Exercise 06</b></a> — Tests Repeatable Read isolation's effectiveness against Phantom Reads by maintaining stable data snapshots despite concurrent insertions.

<a href="ex07/day08_ex07.sql"><b>Exercise 07</b></a> — Creates and analyzes a deadlock scenario where two sessions block each other's updates, demonstrating database deadlock detection and resolution mechanisms.