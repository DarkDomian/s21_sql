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
### <a href="ex00/day00_ex00.sql">Exercise 00</a>
Returns names and ages of all people from the city 'Kazan'.

### <a href="ex01/day00_ex01.sql">Exercise 01</a>
Returns names and ages of all women from the city 'Kazan', sorted by name.

### <a href="ex02/day00_ex02.sql">Exercise 02</a>
Returns pizzerias with ratings between 3.5 and 5 points, ordered by rating, using two different syntax approaches.

### <a href="ex03/day00_ex03.sql">Exercise 03</a>
Returns unique person identifiers who visited pizzerias between January 6-9, 2022 or visited pizzeria with ID 2, ordered by person ID in descending order.

### <a href="ex04/day00_ex04.sql">Exercise 04</a>
Returns a formatted string with person information combining name, age, gender, and address, ordered by the calculated field.

### <a href="ex05/day00_ex05.sql">Exercise 05</a>
Returns names of people who ordered menu items 13, 14, or 18 on January 7, 2022, using a subquery in SELECT clause.

### <a href="ex06/day00_ex06.sql">Exercise 06</a>
Extends Exercise 05 by adding a check column that returns true if the person name is 'Denis'.

### <a href="ex07/day00_ex07.sql">Exercise 07</a>
Returns person IDs, names, and age intervals categorized into three ranges, sorted by interval info.

### <a href="ex08/day00_ex08.sql">Exercise 08</a>
Returns all columns from person_order where the ID is an even number, ordered by ID.

### <a href="ex09/day00_ex09.sql">Exercise 09</a>
Returns person names and pizzeria names for visits between January 7-9, 2022, ordered by person name ascending and pizzeria name descending.