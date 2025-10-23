# The s21 SQL bootcamp - `basic`

### Prerequisites
- Docker & Docker Compose

### Database Setup
1. Start containers:
```bash
docker-compose up -d
```

2. Access pgAdmin at [`localhost:80`](http://localhost:80)
   - Login: `trelawnm@student.21-school.ru`
   - Password: `secretpassword`

3. Register database server in pgAdmin:
   - **General Tab**: Any server name
   - **Connections Tab**:
     - Host: `postgres`
     - Port: `5432`
     - Database: `mydatabase`
     - Username: `trelawnm`
     - Password: `school21`

### Stop Services
```bash
docker-compose down
```

## SQL Queries
<a href="ex00/day00_ex00.sql"><b>Exercise 00</b></a> — Returns names and ages of all people from the city 'Kazan'.

<a href="ex01/day00_ex01.sql"><b>Exercise 01</b></a> — Returns names and ages of all women from the city 'Kazan', sorted by name.

<a href="ex02/day00_ex02.sql"><b>Exercise 02</b></a>  — Returns pizzerias with ratings between 3.5 and 5 points, ordered by rating, using two different syntax approaches.

<a href="ex03/day00_ex03.sql"><b>Exercise 03</b></a>  — Returns unique person identifiers who visited pizzerias between January 6-9, 2022 or visited pizzeria with ID 2, ordered by person ID in descending order.

<a href="ex04/day00_ex04.sql"><b>Exercise 04</b></a> — Returns a formatted string with person information combining name, age, gender, and address, ordered by the calculated field.

<a href="ex05/day00_ex05.sql"><b>Exercise 05</b></a> — Returns names of people who ordered menu items 13, 14, or 18 on January 7, 2022, using a subquery in SELECT clause.

<a href="ex06/day00_ex06.sql"><b>Exercise 06</b></a> — Extends <b>Exercise 05</b> by adding a check column that returns true if the person name is 'Denis'.

<a href="ex07/day00_ex07.sql"><b>Exercise 07</b></a> — Returns person IDs, names, and age intervals categorized into three ranges, sorted by interval info.

<a href="ex08/day00_ex08.sql"><b>Exercise 08</b></a> — Returns all columns from person_order where the ID is an even number, ordered by ID.

<a href="ex09/day00_ex09.sql"><b>Exercise 09</b></a> — Returns person names and pizzeria names for visits between January 7-9, 2022, ordered by person name ascending and pizzeria name descending.