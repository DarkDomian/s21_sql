## SQL bootcamp - `deep-joins`

<a href="ex00/day06_ex00.sql"><b>Exercise 00</b></a> — Implements a new business feature by creating a `person_discounts` table to store personalized discount percentages for customers at different pizzerias, with proper foreign key relationships and constraints.

<a href="ex01/day06_ex01.sql"><b>Exercise 01</b></a> — Populates the discount table by calculating personalized discount rates based on order history, applying tiered discounts (10.5%, 22%, or 30%) depending on the number of orders per person-pizzeria combination.

<a href="ex02/day06_ex02.sql"><b>Exercise 02</b></a> — Generates a comprehensive order report showing original prices and discounted prices for all person orders, including person name, pizza name, and pizzeria information for better business analytics.

<a href="ex03/day06_ex03.sql"><b>Exercise 03</b></a> — Enhances data integrity by creating a unique composite index on person-pizzeria pairs to prevent duplicate discount entries, with performance validation using EXPLAIN ANALYZE.

<a href="ex04/day06_ex04.sql"><b>Exercise 04</b></a> — Strengthens data consistency through multiple constraints including non-null validations, default values, and range checks to ensure discount data quality and business rule enforcement.

<a href="ex05/day06_ex05.sql"><b>Exercise 05</b></a> — Implements data governance standards by adding comprehensive documentation through table and column comments, providing clear business context for the discount management system.

<a href="ex06/day06_ex06.sql"><b>Exercise 06</b></a> — Automates primary key generation using database sequences, ensuring reliable and conflict-free ID assignment for new discount records while maintaining referential integrity.