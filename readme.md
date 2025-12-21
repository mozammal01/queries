# Vehicle Rental System - SQL Queries

A SQL assignment demonstrating database design and query operations for a vehicle rental management system.

## Database Schema

| Table      | Description                                   |
| ---------- | --------------------------------------------- |
| `users`    | Stores customer and admin information         |
| `vehicles` | Contains vehicle inventory with rental prices |
| `bookings` | Tracks rental bookings and their status       |

## Queries & Solutions

### 1. List All Bookings with Customer and Vehicle Details

```sql
SELECT b.booking_id, u.name AS customer_name, v.name AS vehicle_name,
       b.start_date, b.end_date, b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
```

**Purpose:** Retrieves complete booking information by joining all three tables.

---

### 2. Find Vehicles with No Bookings

```sql
SELECT * FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1 FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;
```

**Purpose:** Identifies vehicles that have never been booked using a subquery.

---

### 3. Get Available Cars

```sql
SELECT * FROM vehicles
WHERE status = 'available' AND type = 'car';
```

**Purpose:** Filters vehicles to show only cars that are currently available for rent.

---

### 4. Vehicles with More Than 2 Bookings

```sql
SELECT v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;
```

**Purpose:** Aggregates booking counts and filters for high-demand vehicles.

---

## How to Run

1. Execute the table creation statements
2. Insert the sample data
3. Run the queries to see results

## Tech Stack

- **Database:** PostgreSQL / MySQL
