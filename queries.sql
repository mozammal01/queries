-- users table
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150),
  phone VARCHAR(25),
  role VARCHAR(50)
)



INSERT INTO users (user_id, name, email, phone, role) VALUES
(1, 'Alice', 'alice@example.com', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Customer');

-- vehicles table

CREATE TABLE vehicles (
  vehicle_id INT PRIMARY KEY,
  name VARCHAR(100),
  type VARCHAR(50),
  model VARCHAR(50),
  registration_number VARCHAR(100) UNIQUE,
  rental_price DECIMAL(10, 2),
  status VARCHAR(50)
)

  INSERT INTO vehicles (vehicle_id, name, type, model, registration_number, rental_price, status)
VALUES
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');


CREATE TABLE bookings(
  booking_id INT PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  vehicle_id INT REFERENCES vehicles(vehicle_id),
  start_date DATE,
  end_date DATE,
  status VARCHAR(50),
  total_cost DECIMAL(10, 2)
)
  

INSERT INTO bookings 
(booking_id, user_id, vehicle_id, start_date, end_date, status, total_cost)
VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);




-- Filtering 

-- 1
SELECT 
b.booking_id,
u.name as customer_name, 
v.name as vehicle_name, 
b.start_date , 
b.end_date, 
b.status 
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles  v ON b.vehicle_id = v.vehicle_id

-- 2
SELECT * FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1 FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;
  
-- 3
SELECT * FROM vehicles 
WHERE status = 'available' and type = 'car'

-- 4
SELECT v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;