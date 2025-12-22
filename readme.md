# Vehicle Rental System - SQL Queries

## Project Overview

This project demonstrates a **Vehicle Rental Management System** database implementation using SQL. The system is designed to manage vehicle rentals, track customer bookings, and maintain vehicle inventory. It showcases fundamental database concepts including table relationships, data integrity constraints, and complex query operations.

### Key Features

- **User Management**: Track customers and administrators with contact information
- **Vehicle Inventory**: Manage different vehicle types (cars, bikes, trucks) with rental pricing
- **Booking System**: Handle rental reservations with status tracking and cost calculation
- **Reporting Queries**: Extract meaningful insights from rental data

---

## Database Schema

| Table      | Description                                   |
| ---------- | --------------------------------------------- |
| `users`    | Stores customer and admin information         |
| `vehicles` | Contains vehicle inventory with rental prices |
| `bookings` | Tracks rental bookings and their status       |

### Entity Relationship

```
users (1) ----< (N) bookings (N) >---- (1) vehicles
```

- One user can have multiple bookings
- One vehicle can be associated with multiple bookings
- Each booking links one user to one vehicle

### Table Structures

#### Users Table

Stores information about system users including customers and administrators.

```sql
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150) UNIQUE,
  phone VARCHAR(25),
  role VARCHAR(50)
)
```

| Column  | Type         | Constraints | Description                    |
| ------- | ------------ | ----------- | ------------------------------ |
| user_id | INT          | PRIMARY KEY | Unique identifier for the user |
| name    | VARCHAR(100) |             | Full name of the user          |
| email   | VARCHAR(150) | UNIQUE      | Email address (must be unique) |
| phone   | VARCHAR(25)  |             | Contact phone number           |
| role    | VARCHAR(50)  |             | User role (Customer/Admin)     |

#### Vehicles Table

Contains the vehicle inventory available for rental.

```sql
CREATE TABLE vehicles (
  vehicle_id INT PRIMARY KEY,
  name VARCHAR(100),
  type VARCHAR(50),
  model VARCHAR(50),
  registration_number VARCHAR(100) UNIQUE,
  rental_price DECIMAL(10, 2),
  status VARCHAR(50)
)
```

| Column              | Type           | Constraints | Description                                 |
| ------------------- | -------------- | ----------- | ------------------------------------------- |
| vehicle_id          | INT            | PRIMARY KEY | Unique identifier for the vehicle           |
| name                | VARCHAR(100)   |             | Vehicle name/brand                          |
| type                | VARCHAR(50)    |             | Vehicle type (car, bike, truck)             |
| model               | VARCHAR(50)    |             | Model year                                  |
| registration_number | VARCHAR(100)   | UNIQUE      | Vehicle registration plate                  |
| rental_price        | DECIMAL(10, 2) |             | Daily rental price                          |
| status              | VARCHAR(50)    |             | Availability (available/rented/maintenance) |

#### Bookings Table

Tracks all rental bookings made by customers.

```sql
CREATE TABLE bookings (
  booking_id INT PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  vehicle_id INT REFERENCES vehicles(vehicle_id),
  start_date DATE,
  end_date DATE,
  status VARCHAR(50),
  total_cost DECIMAL(10, 2)
)
```

| Column     | Type           | Constraints            | Description                                  |
| ---------- | -------------- | ---------------------- | -------------------------------------------- |
| booking_id | INT            | PRIMARY KEY            | Unique identifier for the booking            |
| user_id    | INT            | FOREIGN KEY → users    | Reference to the customer                    |
| vehicle_id | INT            | FOREIGN KEY → vehicles | Reference to the rented vehicle              |
| start_date | DATE           |                        | Rental start date                            |
| end_date   | DATE           |                        | Rental end date                              |
| status     | VARCHAR(50)    |                        | Booking status (pending/confirmed/completed) |
| total_cost | DECIMAL(10, 2) |                        | Total rental cost                            |

---

## Tech Stack

- **Database:** PostgreSQL
- **SQL Standard:** PostgreSQL-compatible SQL

---

## How to Run

1. **Set up PostgreSQL**: Ensure PostgreSQL is installed and running
2. **Create Database**: Create a new database for this project
3. **Run Schema**: Execute the `queries.sql` file to create tables and insert sample data
4. **Execute Queries**: Run the query solutions to see results

```bash
# Connect to PostgreSQL and run the script
psql -U your_username -d your_database -f queries.sql
```

---

## Author

Vehicle Rental System SQL Assignment
