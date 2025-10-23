# <span><a href="https://21-school.ru/?utm_source=school21&utm_medium=student_nino&utm_campaign=trelawnm___"><img style="height: 1em;" src="misc/heart.gif"></a></span> The 21 School `SQL Bootcamp`

Applied PostgreSQL: Building production-ready SQL skills through 100+ practical exercises and real-world database challenges from School 21 curriculum.

![sql library](misc/sql_library.jpg)

## Quick start
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

## Learning Journey

- <a href="./basic/"><b>Day 00: First Steps in SQL</b></a>
- <a href="./sets-joins/"><b>Day 01: Sets & JOINs</b></a>
<!-- 
- Day 01: Building SQL Foundations
- Day 02: Deep Dive into Queries
- Day 03: Advanced SQL Patterns
- Day 04: SQL Optimization & Performance
- Day 05: Mastering Complex Scenarios
-->