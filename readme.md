# Vehicle Rental System Database

A database project for managing vehicle rentals, customer bookings, and vehicle inventory.

## Database Structure

The system uses three main tables:

- **users** - Customer and admin information
- **vehicles** - Vehicle inventory with pricing
- **bookings** - Rental records linking users to vehicles

### Relationships

```
users (1) ----< (N) bookings (N) >---- (1) vehicles
```

Each user can have multiple bookings, and each vehicle can appear in multiple bookings.

---

## Tables

### users

```sql
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150) UNIQUE,
  phone VARCHAR(25),
  role VARCHAR(50)
);
```

### vehicles

```sql
CREATE TABLE vehicles (
  vehicle_id INT PRIMARY KEY,
  name VARCHAR(100),
  type VARCHAR(50),
  model VARCHAR(50),
  registration_number VARCHAR(100) UNIQUE,
  rental_price DECIMAL(10, 2),
  status VARCHAR(50)
);
```

Status options: `available`, `rented`, `maintenance`

### bookings

```sql
CREATE TABLE bookings (
  booking_id INT PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  vehicle_id INT REFERENCES vehicles(vehicle_id),
  start_date DATE,
  end_date DATE,
  status VARCHAR(50),
  total_cost DECIMAL(10, 2)
);
```

Status options: `pending`, `confirmed`, `completed`

---

## Queries

1. **Join Query** - Get all bookings with customer names and vehicle details
2. **Subquery** - Find vehicles that have never been booked using NOT EXISTS
3. **Filter** - Get available cars only
4. **Aggregation** - Find vehicles with more than 2 bookings using GROUP BY and HAVING

---

## Setup

**Requirements:** PostgreSQL

Run the SQL file:

```bash
psql -U username -d database_name -f queries.sql
```

Or open `queries.sql` in pgAdmin and execute.

---

## Tech Stack

- PostgreSQL
- SQL
