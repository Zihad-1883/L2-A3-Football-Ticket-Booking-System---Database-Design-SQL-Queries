# 🏟️ Football Ticket Booking System
### Database Design & SQL Queries — Level 2 Assignment 3

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Database-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📌 Project Overview

A fully designed and implemented relational database system for managing football ticket bookings. The system handles fan registrations, match scheduling, and individual ticket purchase records — built entirely in PostgreSQL with proper constraints, foreign key relationships, and complex queries.

---

## 🧱 Database Schema
---

The system consists of **3 relational tables:**

### 👤 Users
Stores all platform users — both fans and ticket managers.

| Column | Type | Constraint |
|---|---|---|
| user_id | SERIAL | PRIMARY KEY |
| full_name | VARCHAR(150) | — |
| email | VARCHAR(225) | UNIQUE |
| role | VARCHAR(20) | CHECK (Ticket Manager, Football Fan) |
| phone_number | VARCHAR(15) | NULLABLE |

### ⚽ Matches
Catalogs all football events with pricing and availability status.

| Column | Type | Constraint |
|---|---|---|
| match_id | SERIAL | PRIMARY KEY |
| fixture | VARCHAR(100) | — |
| tournament_category | VARCHAR(100) | — |
| base_ticket_price | NUMERIC(10,2) | CHECK >= 0 |
| match_status | VARCHAR(20) | CHECK (Available, Selling Fast, Sold Out, Postponed) |

### 🎟️ Bookings
Transactional table linking users to their purchased match tickets.

| Column | Type | Constraint |
|---|---|---|
| booking_id | SERIAL | PRIMARY KEY |
| user_id | INTEGER | FK → Users(user_id) |
| match_id | INTEGER | FK → Matches(match_id) |
| seat_number | VARCHAR(10) | NULLABLE |
| payment_status | VARCHAR(12) | CHECK (Pending, Confirmed, Cancelled, Refunded) |
| total_cost | NUMERIC(10,2) | CHECK >= 0 |

---

- **One to Many** — One User → Many Bookings
- **Many to One** — Many Bookings → One Match
- **One to One (logical)** — Each Booking row maps exactly one User to one Match

---

## 📋 SQL Queries Implemented

| # | Query | Concepts Used |
|---|---|---|
| 1 | Retrieve available Champions League matches | WHERE, AND |
| 2 | Search users by name pattern | LIKE, ILIKE |
| 3 | Find bookings with missing payment status | IS NULL, COALESCE |
| 4 | Booking details with user name and fixture | INNER JOIN |
| 5 | All users including those with no bookings | LEFT JOIN |
| 6 | Bookings above average total cost | Subquery, AVG() |
| 7 | Top 2 matches skipping the most expensive | ORDER BY, LIMIT, OFFSET |

---

## ▶️ How to Run

**Prerequisites:** PostgreSQL installed on your machine.

**Step 1 — Open your PostgreSQL client** (psql, pgAdmin, or DBeaver)

**Step 2 — Create a new database:**
```sql
CREATE DATABASE football_booking;
```

**Step 3 — Connect to the database and run the file:**
```bash
psql -U postgres -d football_booking -f QUERY.sql
```

Or paste the contents of `QUERY.sql` directly into your SQL editor and execute.

---

## 🧪 Sample Data

| Table | Records |
|---|---|
| Users | 4 (3 Football Fans, 1 Ticket Manager) |
| Matches | 5 (Champions League, Premier League, Serie A) |
| Bookings | 5 (mix of Confirmed, Pending, and NULL status) |

---

## 👤 Author

**Zihad** — Level 2 Database Assignment
- GitHub: [@Zihad-1883](https://github.com/Zihad-1883)

---

*Submitted July 2026*
