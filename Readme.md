# Vehicle Rental System - SQL Project

## Project Overview
This project is a **Vehicle Rental System** database implemented in PostgreSQL.  
It allows management of **users**, **vehicles**, and **bookings** while maintaining data integrity through proper relationships and constraints.  

### Key Features:
- Stores **user information** including role (Admin/Customer), email, and phone number.
- Stores **vehicle information** including type, model, registration number, rental price, and availability status.
- Tracks **bookings**, including which user booked which vehicle, rental period, booking status, and total cost.
- Maintains relationships:
  - One-to-Many: Users → Bookings
  - Many-to-One: Bookings → Vehicles
  - Logical One-to-One: Each booking links one user and one vehicle.
- Enforces uniqueness and constraints to prevent invalid data (e.g., unique emails, unique registration numbers, valid statuses).

---

## Database Schema

### **Users Table**
- Columns: `user_id`, `role`, `name`, `email`, `password`, `phone`
- Constraints: 
  - `email` must be unique
  - `role` restricted to Admin or Customer

### **Vehicles Table**
- Columns: `vehicle_id`, `vehicle_name`, `type`, `model`, `registration_number`, `rental_price_per_day`, `availability_status`
- Constraints: 
  - `registration_number` unique
  - `type` limited to Car/Bike/Truck
  - `availability_status` limited to Available/Rented/Maintenance

### **Bookings Table**
- Columns: `booking_id`, `user_id`, `vehicle_id`, `start_date`, `end_date`, `booking_status`, `total_cost`
- Constraints: 
  - Foreign keys to `users(user_id)` and `vehicles(vehicle_id)`
  - Booking dates validated: `end_date >= start_date`
  - `booking_status` restricted to Pending/Confirmed/Completed/Cancelled

---

## Queries & Solutions

All SQL queries are stored in `queries.sql`. They include:

1. **INNER JOIN** – Retrieve booking info along with customer and vehicle names.
2. **NOT EXISTS** – Find vehicles that have never been booked.
3. **WHERE** – Retrieve available vehicles of a specific type.
4. **GROUP BY + HAVING** – Count bookings per vehicle and filter vehicles with more than 2 bookings.

Refer to `queries.sql` for complete implementations.

---

## Technology Stack
- **Database:** PostgreSQL
- **SQL Concepts Used:**  
  - Data Definition Language (DDL): CREATE TABLE, CONSTRAINTS, CHECK, UNIQUE  
  - Data Manipulation Language (DML): SELECT, JOIN, WHERE, GROUP BY, HAVING  
  - Aggregate Functions: COUNT  
  - Subqueries: NOT EXISTS

---

## How to Use
1. Create a PostgreSQL database.
2. Run the `schema.sql` to create tables.
3. Run `queries.sql` to execute sample queries.
4. Populate the tables with sample data using `INSERT` statements (optional).


