# Vehicle Rental System - SQL Queries

A SQL assignment demonstrating database design and query operations for a vehicle rental management system.

## Database Schema

| Table      | Description                                   |
| ---------- | --------------------------------------------- |
| `users`    | Stores customer and admin information         |
| `vehicles` | Contains vehicle inventory with rental prices |
| `bookings` | Tracks rental bookings and their status       |

## Queries & Solutions

### 1. Retrieve booking information along with Customer name and Vehicle name.

```sql
SELECT b.booking_id, u.name AS customer_name, v.name AS vehicle_name,
       b.start_date, b.end_date, b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
```

---

### 2. Find all vehicles that have never been booked.

```sql
SELECT * FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1 FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;
```

---

### 3. Retrieve all available vehicles of a specific type (e.g. cars).

```sql
SELECT * FROM vehicles
WHERE status = 'available' AND type = 'car';
```

---

### 4. Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

```sql
SELECT v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;
```

---

## How to Run

1. Create the tables
2. Insert the data
3. Run the queries to see results

## Tech Stack

- **Database:** PostgreSQL 
